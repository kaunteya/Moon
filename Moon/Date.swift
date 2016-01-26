//
//  Date.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation

import UIKit

extension NSDate {

    static var startDate: NSDate {
        return NSDate.startMonth.dateAtStartOfWeek()
    }

    static var startMonth: NSDate {
        var startDate = NSDate()
        startDate = startDate.dateAtTheStartOfMonth()
        startDate = startDate.dateBySubtractingDays(80)
        startDate = startDate.dateAtTheStartOfMonth()
        return startDate.dateAtStartOfDay()
    }

    static var endDate: NSDate {
        let endDate = NSDate(fromString:  "2016-12-31", format: .ISO8601(nil))
        return endDate.dateAtStartOfDay()
    }

    var log: String {
        return self.toString(format: .Custom("dd MMM yyyy"))
        //        self.toString(format: .Custom("dd MMM yyyy HH:mm:ss"))
    }

    func dateByAddingMonths(months: Int) -> NSDate
    {
        let dateComp = NSDateComponents()
        dateComp.month = months
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComp, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }

    func dateBySubstractingMonths(months: Int) -> NSDate
    {
        let dateComp = NSDateComponents()
        dateComp.month = (months * -1)
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComp, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }

    static func monthAtIndex(month: Int) -> String? {
        guard month >= 1 && month <= 12 else {
            return nil
        }
        return ["January", "February", "March", "April", "May", "June", "July", "August", "May", "June", "July", "August", "September", "October", "November", "December"][month - 1]
    }
}
