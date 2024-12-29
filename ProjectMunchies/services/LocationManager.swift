//
//  LocationManager.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 6/2/24.
//

import SwiftUI
import CoreLocation
import MapKit
import Combine

class LocationManager: NSObject, ObservableObject, MKMapViewDelegate, CLLocationManagerDelegate {
    var cancellable: AnyCancellable?
    @Published var searchModel: SearchModel = SearchModel(id: "", searchText: "", mapAlertType: "")
    @Published var userLocation: CLLocation?
    @Published var pickedLocation: CLLocation?
    @Published var pickedPlaceMark: CLPlacemark?
    @Published var fetchedPlaces: [VenueModelDTO]?
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    @Published var activeTab: NavBarTabsModel = .home
    @Published var venueTitle: String = ""
    @Published var venueAlertType: String = ""
    
    override init() {
        super.init()
        
        manager.delegate = self
        mapView.delegate = self
        
        // MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        
        // MARK: Search Textfield Watching
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
    
    func fetchPlaces(value: SearchModel) {
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.searchText.lowercased()
                request.region = .downtownTampa
                
                let response = try await MKLocalSearch(request: request).start()
                // We can also use Mainactor to publish changes in the Main Thread
                await MainActor.run(body: {
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> VenueModelDTO in
                        return VenueModelDTO(id: "", name: item.name ?? "", coordinates: item.placemark.coordinate, fetchedPlace: item.placemark, mapAlertType: value.mapAlertType)
                    })
                })
            }
            catch{
                // HANDLE ERROR
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        // Handle Error
        print("error in locationManager:")
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else{return}
        self.userLocation = currentLocation
        mapView.region = .downtownTampa
    }
    
    // MARK: Location Authorization
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .authorizedAlways: manager.requestLocation()
        case .authorizedWhenInUse: manager.requestLocation()
        case .denied: handleLocationError()
        case .notDetermined: manager.requestWhenInUseAuthorization()
        default: break
        }
    }
    
    func handleLocationError() {
        print("error in locationManager: you're not authorized")
    }
    
    func search(value: String, alertType: String) {
        var search = SearchModel(id: "", searchText: value, mapAlertType: alertType)
        searchModel = search
    }
    
    // MARK: Add draggable pin to MapView
    func addDraggablePin(coordinate: CLLocationCoordinate2D, annotations: [MKPointAnnotation] = []) {
        let annotation = MKPointAnnotation()
        annotation.coordinate = coordinate
//      annotation.title = "WHat is this title for?"
    //  mapView.addAnnotation(annotation)

        mapView.addAnnotations(annotations)
    }
    
    // MARK: Enabling dragging
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
       
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "DELIVERYPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        marker.animatesWhenAdded = true
        
        // change color based on mapAlertType
        // we set it to subtitle couldnt find better property in annotation
        if annotation.subtitle == "reviews" {
            marker.markerTintColor = .red
        } else if annotation.subtitle == "specials" {
            marker.markerTintColor = .yellow
        }
        else {
            marker.markerTintColor = .black
        }

        return marker
    }
    
    // MARK: When you drag a pin on MapView
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else{return}
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
        updatePlacemark(location: .init(latitude: newLocation.latitude, longitude: newLocation.longitude))
    }
    
    // MARK: When you select a pin on MapView
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let newLocation = view.annotation?.coordinate else{return}
        self.venueTitle = (view.annotation?.title!)!
        self.venueAlertType = (view.annotation?.subtitle!)!
        self.activeTab = .venue
        self.pickedLocation = .init(latitude: newLocation.latitude, longitude: newLocation.longitude)
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

    // MARK: Displaying new location data
    func reverseLocationCoordinate(location: CLLocation)async throws -> CLPlacemark?{
        let place = try await CLGeocoder().reverseGeocodeLocation(location).first
        return place
    }
}
