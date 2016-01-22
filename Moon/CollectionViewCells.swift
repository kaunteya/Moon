//
//  CollectionViewCells.swift
//  CollectionTry
//
//  Created by Kaunteya Suryawanshi on 20/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//


import UIKit

class DateCell: UICollectionViewCell {
    var dateSource: NSDate!
    @IBOutlet weak var dateField: UILabel!
    @IBOutlet weak var backgroundCircle: UIView!

    override func awakeFromNib() {
        backgroundCircle.layer.backgroundColor = Color.backgroundBlue.CGColor
        backgroundCircle.layer.cornerRadius = (backgroundCircle.bounds.height / 2) * 1.11
    }

    func makeCellForDate(date: NSDate) {
        dateSource = date
        dateField.text = "\(date.day())"

        let today = NSDate.yesterday().dateByAddingDays(1)
        if date.compare(today) == .OrderedAscending {
            self.backgroundColor = Color.lightGray
        } else {
            self.backgroundColor = UIColor.whiteColor()
        }
        if date.isToday() {
            dateField.font = UIFont.boldSystemFontOfSize(dateField.font.pointSize)
        } else {
            dateField.font = UIFont.systemFontOfSize(dateField.font.pointSize)
        }
    }

    override var selected: Bool {
        didSet {
            if selected {
                backgroundCircle.hidden = false
                dateField.textColor = UIColor.whiteColor()

            } else {
                backgroundCircle.hidden = true
                dateField.textColor = UIColor.blackColor()
            }
        }
    }

}

class FirstDayCell: DateCell {
    @IBOutlet weak var monthField: UILabel!

    override func makeCellForDate(date: NSDate) {
        super.makeCellForDate(date)
        self.monthField.text = date.shortMonthToString()
    }

    override var selected: Bool {
        didSet {
            if selected {
                monthField.hidden = true
            } else {
                backgroundCircle.hidden = true
                monthField.hidden = false
                dateField.textColor = Color.orange
                monthField.textColor = Color.orange
            }
        }
    }
}

