//
//  DateUtils.swift
//  Nano3
//
//  Created by Lucas Flores on 01/10/23.
//

import Foundation
class DateUtils {
    public static func getYear() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        let year = dateFormatter.string(from: now)
        return year
    }
    
    public static func getMonth() -> String {
        let now = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        let nameOfMonth = dateFormatter.string(from: now)
        return nameOfMonth
    }
    
    public static func getDay() -> String {
        let date = Date()
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: date)
        let dayOfMonth = components.day!
        return "\(dayOfMonth)"
    }
}
