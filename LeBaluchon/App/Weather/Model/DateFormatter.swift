//
//  DateFormatter.swift
//  LeBaluchon
//
//  Created by Damien Rojo on 04.03.20.
//  Copyright © 2020 Damien Rojo. All rights reserved.
//

import Foundation

final class DateFormatter {
    class func hourMinutesFormat(date: TimeInterval) -> String {
        let date = Date(timeIntervalSince1970: date)
        let formatter = Foundation.DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
}
