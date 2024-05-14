//
//  LiveReviewDateExt.swift
//  ProjectMunchies
//
//  Created by Marcus Mckoy on 5/8/24.
//

import Foundation




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
