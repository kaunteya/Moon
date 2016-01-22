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

        self.addChildViewController(tableViewController)
        tableViewController.didMoveToParentViewController(self)

        self.addChildViewController(calendarViewController)
        tableViewController.didMoveToParentViewController(self)
        
        calendarViewController.updateLayout()
        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "AppIcon29x29")!)
    }

    override func viewDidAppear(animated: Bool) {
    }

}
