//
//  ViewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 19/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet var tableViewController: EventTableviewController!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.addChildViewController(tableViewController)
        tableViewController.didMoveToParentViewController(self)
        
        // Collection View
        let layout: UICollectionViewFlowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)
        layout.itemSize = {
            let screenRect = UIScreen.mainScreen().bounds
            let width = screenRect.width / 7
            let height = collectionView.bounds.height / 4
            return CGSize(width: width, height: height)
            }()

        self.navigationItem.titleView =  UIImageView(image: UIImage(named: "AppIcon29x29")!)
    }

    override func viewDidAppear(animated: Bool) {
        let delta = NSDate.startDate.daysBeforeDate(NSDate())
        let indexPath = NSIndexPath(forItem: delta, inSection: 0)
        collectionView.selectItemAtIndexPath(indexPath, animated: false, scrollPosition: .CenteredVertically)
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Left, animated: false)
    }

}

extension ViewController: UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return NSDate.startDate.daysBeforeDate(NSDate.endDate)
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let index: Int = indexPath.indexAtPosition(1)
        let date = NSDate.startDate.dateByAddingDays(index)

        if date.day() == 1 {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("firstDayCell", forIndexPath: indexPath) as! FirstDayCell
            cell.makeCellForDate(date)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("dateCell", forIndexPath: indexPath) as! DateCell
            cell.makeCellForDate(date)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegate {

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        collectionView.alpha = 0.3
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        collectionView.alpha = 1.0
    }
}
