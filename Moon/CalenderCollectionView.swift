//
//  CalenderCollectionView.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class CalenderCollectionView: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    func updateLayout() {
        // Collection View
        let layout: UICollectionViewFlowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)

        layout.itemSize.width = {
            let screenRect = UIScreen.mainScreen().bounds
            let width = screenRect.width / 7
            return width
            }()
    }

    func notifySelectedDateChangedToDate(date: NSDate, animated: Bool) {
        let delta = NSDate.startDate.daysBeforeDate(date)
        let indexPath = NSIndexPath(forItem: delta, inSection: 0)
        collectionView.selectItemAtIndexPath(indexPath, animated: false, scrollPosition: .CenteredVertically)
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Top, animated: animated)
    }
}

extension CalenderCollectionView: UICollectionViewDataSource {

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

extension CalenderCollectionView: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! DateCell
        (self.parentViewController as! ViewController).tableViewController.notifySelectedDateChangedToDate(cell.dateSource, animated: true)
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        collectionView.alpha = 0.3
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        collectionView.alpha = 1.0
    }
}
