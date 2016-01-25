//
//  EventTableviewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class EventTableviewController: UIViewController {
    @IBOutlet weak var tableView_: UITableView!

    let names = ["A"]

    func notifySelectedDateChangedToDate(date: NSDate, animated: Bool) {
        let indexPath = NSIndexPath(forRow: 0, inSection: NSDate.startDate.daysBeforeDate(date))
        tableView_.scrollToRowAtIndexPath(indexPath, atScrollPosition: .Top, animated: animated)
    }
}

extension EventTableviewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return NSDate.startDate.daysBeforeDate(NSDate.endDate)
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCellNoEvent")!
        let index: Int = indexPath.indexAtPosition(1)
//        cell.textLabel?.text = names[index]
        return cell
    }
}

extension EventTableviewController: UITableViewDelegate {

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25.0
    }

    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return CGFloat.min
    }

    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let date = NSDate.startDate.dateByAddingDays(section)
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 25))
        let label: UILabel = UILabel(frame: CGRect(x: 10, y: 2, width: tableView.frame.size.width, height: 18))
        label.font = UIFont.boldSystemFontOfSize(12)

        // Update the labels in section headers
        label.text = {
            var str = "\(date.weekdayToString()), \(date.day()) \(date.monthToString())"
            if date.isToday() {
                str = "TODAY ∙ " + str
            } else if date.isYesterday() {
                str = "YESTERDAY ∙ " + str
            } else if date.isTomorrow() {
                str = "TOMORROW ∙ " + str
            }
            return str
            }()

        label.textColor = date.isToday() ? Color.todayTitle : Color.tableTitle
        view.addSubview(label)
        view.backgroundColor = Color.tableHeader

        return view
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        // Notify calenderView to compress its height
        (self.parentViewController as! ViewController).calendarViewController.compressHeight = true
    }
}
