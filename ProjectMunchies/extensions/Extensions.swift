//
//  Extensions.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import SwiftUI
import CoreLocation
import MapKit

extension DragGesture.Value {
    func percentage(in geometry: GeometryProxy) -> CGFloat {
        abs(translation.width / geometry.size.width)
    }
}

extension Array where Element == ProfileModel {
    func cardOffset(cardId: Int) -> CGFloat {
        CGFloat(count - 1 - cardId) * 8
    }
    
    func cardWidth(in geometry: GeometryProxy, cardId: Int) -> CGFloat {
        geometry.size.width - cardOffset(cardId: cardId)
    }
}

extension Date {
    public static func today() -> Date {
        return Date()
    }
    
    public func next(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.next,
                   weekday,
                   considerToday: considerToday)
    }
    
    public func previous(_ weekday: Weekday, considerToday: Bool = false) -> Date {
        return get(.previous,
                   weekday,
                   considerToday: considerToday)
    }
    
    func get(_ direction: SearchDirection,
             _ weekDay: Weekday,
             considerToday consider: Bool = false) -> Date {
        
        let dayName = weekDay.rawValue
        let weekdaysName = getWeekDaysInEnglish().map { $0.lowercased() }
        
        assert(weekdaysName.contains(dayName), "weekday symbol should be in form \(weekdaysName)")
        
        let searchWeekdayIndex = weekdaysName.firstIndex(of: dayName)! + 1
        let calendar = Calendar(identifier: .gregorian)
        
        if consider && calendar.component(.weekday, from: self) == searchWeekdayIndex {
            return self
        }
        
        var nextDateComponent = calendar.dateComponents([.hour, .minute, .second], from: self)
        nextDateComponent.weekday = searchWeekdayIndex
        
        let date = calendar.nextDate(after: self,
                                     matching: nextDateComponent,
                                     matchingPolicy: .nextTime,
                                     direction: direction.calendarSearchDirection)
        
        return date!
    }
    
    func getWeekDaysInEnglish() -> [String] {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US_POSIX")
        return calendar.weekdaySymbols
    }
    
    public enum Weekday: String {
        case monday = "monday",
             tuesday = "tuesday",
             wednesday = "wednesday",
             thursday = "thursday",
             friday = "friday",
             saturday = "saturday",
             sunday = "sunday"
    }
    
    enum SearchDirection {
        case next
        case previous
        
        var calendarSearchDirection: Calendar.SearchDirection {
            switch self {
            case .next:
                return .forward
            case .previous:
                return .backward
            }
        }
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

extension CLLocationCoordinate2D: Equatable {}

public func == (lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}

extension MKCoordinateRegion {
    static var applePark: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 37.334606, longitude: -122.009102)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
    
    static var londonTower: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 51.508, longitude: -0.076)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
    
    static var downtownTampa: MKCoordinateRegion {
        let center = CLLocationCoordinate2D(latitude: 27.964157, longitude: -82.452606)
        return .init(center: center, latitudinalMeters: 10000, longitudinalMeters: 10000)
    }
}

