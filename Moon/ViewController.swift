//
//  ViewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 19/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var calendarViewController: CalenderCollectionView!
    @IBOutlet var tableViewController: EventTableviewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        calendarViewController.updateLayout()

        self.addChildViewController(tableViewController)
        tableViewController.didMoveToParentViewController(self)

        self.addChildViewController(calendarViewController)
        calendarViewController.didMoveToParentViewController(self)

        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "AppIcon29x29")!)
    }

    override func viewDidLayoutSubviews() {
        calendarViewController.viewDidLayoutSubviews()
        tableViewController.viewDidLayoutSubviews()
    }

    override func viewDidAppear(animated: Bool) {
        tableViewController.notifySelectedDateChangedToDate(NSDate(), animated: false)
        calendarViewController.notifySelectedDateChangedToDate(NSDate(), animated: false)
    }
}
