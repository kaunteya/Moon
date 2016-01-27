//
//  OptionsViewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 25/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

/// View which is shown when ⚙ button, at left of navbar is tapped
class OptionsViewController: UITableViewController {

    @IBAction func donePressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
