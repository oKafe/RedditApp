//
//  Date+Ext.swift
//  RedditTop
//
//  Created by Andy Orphan on 18.02.2021.
//

import Foundation

extension Date {
    func timeAgoString() -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: self, relativeTo: Date())
    }
}
