//
//  Date.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation

extension NSDate {

    /// var startMonth shifted to start of week
    static var startDate: NSDate {
        return NSDate.startMonth.dateAtStartOfWeek()
    }

    /// Approximately 3 months back
    static var startMonth: NSDate {
        var startDate = NSDate()
        startDate = startDate.dateAtTheStartOfMonth()
        startDate = startDate.dateBySubtractingDays(80)
        startDate = startDate.dateAtTheStartOfMonth()
        return startDate.dateAtStartOfDay()
    }

    /// Till end of the year
    static var endDate: NSDate {
        let endDate = NSDate(fromString:  "2016-12-31", format: .ISO8601(nil))
        return endDate.dateAtStartOfDay()
    }

    var log: String {
        return self.toString(format: .Custom("dd MMM yyyy"))
        //        self.toString(format: .Custom("dd MMM yyyy HH:mm:ss"))
    }

    func dateByAddingMonths(months: Int) -> NSDate {
        let dateComp = NSDateComponents()
        dateComp.month = months
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComp, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }

    func dateBySubstractingMonths(months: Int) -> NSDate {
        let dateComp = NSDateComponents()
        dateComp.month = (months * -1)
        return NSCalendar.currentCalendar().dateByAddingComponents(dateComp, toDate: self, options: NSCalendarOptions(rawValue: 0))!
    }
}
