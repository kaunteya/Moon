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

        self.updateNavBar()

        calendarViewController.updateLayout()

        self.addChildViewController(tableViewController)
        tableViewController.didMoveToParentViewController(self)

        self.addChildViewController(calendarViewController)
        calendarViewController.didMoveToParentViewController(self)

    }

    /// Update UI and and Title Image to NavBar
    private func updateNavBar() {
        navigationController?.navigationBar.shadowImage = UIImage();
        navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: .Default)

        self.navigationItem.titleView =  {
            let appImage = UIImageView(image: UIImage(named: "AppIcon_noBack")!)
            appImage.frame.size = CGSize(width: 25, height: 25)
            appImage.contentMode = .ScaleAspectFit
            return appImage
            }()
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
