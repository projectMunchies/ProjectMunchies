//
//  LocationManager.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/2/24.
//

import CoreLocation
import MapKit
import Combine

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    @Published var userLocation: CLLocation?
    @Published var pickedPlaceMark: CLPlacemark?
    @Published var fetchedPlaces: [VenueModelDTO]?
    @Published var activeTab: NavBarTabsModel = .home
    @Published var venueTitle: String = ""
    @Published var venueAlertType: String = ""
    @Published var searchModel: SearchModel = SearchModel(id: "", searchText: "", mapAlertType: "")
//    @Published var footest: Bool = UserDefaults.standard.bool(forKey: "footest") {
//        didSet {
//            startFoo()
//        }
//    }
    
    var cancellable: AnyCancellable?
    let appleParkLocation = CLLocationCoordinate2D(latitude: 28.067267962618835,longitude: -82.7075608858218)
    private var notificationCenter = UNUserNotificationCenter.current()
    private var notificationContent = UNMutableNotificationContent()
    
    
    override init() {
        super.init()
        
        manager.delegate = self
        mapView.delegate = self
        
        mapView.region = .downtownTampa
        
        manager.requestAlwaysAuthorization()
        
        // MARK: Notification Authorization
        Task {
            try await notificationCenter.requestAuthorization(options: [.badge])
        }

        
        // MARK: SearchModel Textfield Watching
        cancellable = $searchModel
            .removeDuplicates()
            .sink(receiveValue: { value in
                if value.searchText != "" {
                    self.fetchPlaces(value: value)
                }
                else {
                    self.fetchedPlaces = nil
                }
            })
    }
    
    // MARK: Fires Sink Subscriber in init()
    func search(value: String, alertType: String) {
        let search = SearchModel(id: "", searchText: value, mapAlertType: alertType)
        searchModel = search
    }
    
    func fetchPlaces(value: SearchModel) {
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.searchText.lowercased()
                request.region = .downtownTampa
                
                let response = try await MKLocalSearch(request: request).start()
                
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> VenueModelDTO in
                        return VenueModelDTO(id: "", name: item.name ?? "", coordinates: item.placemark.coordinate, fetchedPlace: item.placemark, mapAlertType: value.mapAlertType)
                    })
                })
            }
            catch{
                // HANDLE ERROR; place logger
            }
        }
    }
    
    // MARK: Handling location errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle Error
        print("error in locationManager:")
        print(error)
    }
    
    // MARK: When your location updates
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else{return}
        self.userLocation = currentLocation
    }
    
    // MARK: Add draggable pin to MapView
    func addDraggablePin(coordinate: CLLocationCoordinate2D, annotations: [MKPointAnnotation] = []) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
        //      annotation.title = "WHat is this title for?"
        //  mapView.addAnnotation(annotation)
        
        mapView.addAnnotations(annotations)
    }
    
    // MARK: When you select a pin on MapView
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let newLocation = view.annotation?.coordinate else{return}
        self.venueTitle = (view.annotation?.title!)!
        self.venueAlertType = (view.annotation?.subtitle!)!
        self.activeTab = .venue
        updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.longitude))
    }
    
    func updatePlacemark(location: CLLocation){
        Task{
            do{
                guard let place = try await reverseLocationCoordinate(location: location) else{return}
                await MainActor.run(body: {
                    self.pickedPlaceMark = place
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    func reverseLocationCoordinate(location: CLLocation)async throws -> CLPlacemark?{
        let place = try await CLGeocoder().reverseGeocodeLocation(location).first
        return place
    }
}
