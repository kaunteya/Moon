//
//  Date.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import Foundation

extension NSDate {
    var isCenterDate: Bool {
        let day = self.day()
        guard day > 8 && day < 22 else {
            return false
        }

        var centerDateOfMonth = self.dateAtTheStartOfMonth()
        centerDateOfMonth = centerDateOfMonth.dateAtStartOfWeek()
        centerDateOfMonth = centerDateOfMonth.dateByAddingDays(14) // Advance 2 weeks
        centerDateOfMonth = centerDateOfMonth.dateByAddingDays(3) // Advance 3 days to center

        return self.isEqualToDateIgnoringTime(centerDateOfMonth)
    }
    var log: String {
        return self.toString(format: .Custom("dd MMM yyyy"))
        //        self.toString(format: .Custom("dd MMM yyyy HH:mm:ss"))
    }
}
