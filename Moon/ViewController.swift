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

        let appImage = UIImageView(image: UIImage(named: "AppIcon_noBack")!)
        appImage.frame.size = CGSize(width: 25, height: 25)
        appImage.contentMode = .ScaleAspectFit
        self.navigationItem.titleView =  appImage
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
