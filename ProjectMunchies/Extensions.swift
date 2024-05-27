//
//  Extensions.swift
//  ProjectMunchies
//
//  Created by DotZ3R0 on 7/28/23.
//

import SwiftUI
import CoreLocation

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
}

// MARK: Helper Date methods
extension Date {
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

public func ==(lhs: CLLocationCoordinate2D, rhs: CLLocationCoordinate2D) -> Bool {
    return lhs.latitude == rhs.latitude && lhs.longitude == rhs.longitude
}


extension Date {
    func timeAgoDisplay(from createdAt: Date) -> String {
        let now = Date()
        let components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute], from: createdAt, to: now)

        let years = components.year ?? 0
        let months = components.month ?? 0
        let days = components.day ?? 0
        let hours = components.hour ?? 0
        let minutes = components.minute ?? 0

        if years > 0 {
            return years == 1 ? "1 year ago" : "\(years) years ago"
        } else if months > 0 {
            return months == 1 ? "1 month ago" : "\(months) months ago"
        } else if days > 0 {
            return days == 1 ? "1 day ago" : "\(days) days ago"
        } else if hours > 0 {
            return hours == 1 ? "1 hour ago" : "\(hours) hours ago"
        } else {
            return minutes == 1 ? "1 minute ago" : "\(minutes) minutes ago"
        }
    }
}
