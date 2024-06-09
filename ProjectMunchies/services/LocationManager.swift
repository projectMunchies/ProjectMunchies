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
    @Published var searchText: String = ""
    @Published var userLocation: CLLocation?
    @Published var pickedLocation: CLLocation?
    @Published var pickedPlaceMark: CLPlacemark?
    @Published var fetchedPlaces: [CLPlacemark]?
    @Published var mapView: MKMapView = .init()
    @Published var manager: CLLocationManager = .init()
    
    override init() {
        super.init()
        
        manager.delegate = self
        mapView.delegate = self
        
        // MARK: Requesting Location Access
        manager.requestWhenInUseAuthorization()
        
        // MARK: Search Textfield Watching
        cancellable = $searchText
            .removeDuplicates()
            .sink(receiveValue: { value in
                if value != "" {
                    self.fetchPlaces(value: value)
                }
                else {
                    self.fetchedPlaces = nil
                }
            })
    }
    
    func fetchPlaces(value: String) {
        Task{
            do{
                let request = MKLocalSearch.Request()
                request.naturalLanguageQuery = value.lowercased()
                
                let response = try await MKLocalSearch(request: request).start()
                // We can also use Mainactor to publish changes in the Main Thread
                await MainActor.run(body: {
               
                    self.fetchedPlaces = response.mapItems.compactMap({ item -> CLPlacemark? in
                        return item.placemark
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
        
    }
    
    func search(value: String) {
        print("this be passes: \(value)")
        searchText = value
    }
    
    // MARK: Add draggable pin to MapView
    func addDraggablePin(coordinate: CLLocationCoordinate2D, annotations: [MKPointAnnotation] = []) {
        let annotation = MKPointAnnotation()

        annotation.coordinate = coordinate
        annotation.title = "WHat is this title for?"
        mapView.addAnnotation(annotation)
        mapView.addAnnotations(annotations)
    }
    
    // MARK: Enabling dragging
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let marker = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "DELIVERYPIN")
        marker.isDraggable = true
        marker.canShowCallout = false
        marker.animatesWhenAdded = true
        marker.markerTintColor = .yellow
        
        return marker
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, didChange newState: MKAnnotationView.DragState, fromOldState oldState: MKAnnotationView.DragState) {
        guard let newLocation = view.annotation?.coordinate else{return}
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
