//
//  CalenderViewController.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 22/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

private let cellHeight = 45.0
private let searchBarHeight = CGFloat(44)

class CalenderViewController: UIViewController {

    var searchBar: UISearchBar!
    var currentSearchOffset: CGFloat = 0.0
    let monthStackView = UIStackView()

    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!

    /// Blurs the cells in collection. Used while dragging
    var blurCalendar: Bool = false {
        didSet {
            for cell in collectionView.visibleCells() as! [DateCell] {
                cell.alpha = blurCalendar ? 0.3 : 1.0
                monthStackView.hidden = !blurCalendar
            }
        }
    }

    /// Triggers height expansion and compression of collection view. Used when focus changes
    var compressHeight: Bool = true {
        didSet {
            guard compressHeight != oldValue else {
                return
            }
            let newHeight = compressHeight ? (cellHeight * 2) : (cellHeight * 5)

            searchBar.frame.origin.y = collectionView.contentOffset.y - searchBarHeight
            collectionView.superview!.layoutIfNeeded()
            heightConstraint.constant = CGFloat(newHeight)
            UIView.animateWithDuration(0.3) { () -> Void in
                self.collectionView.superview!.layoutIfNeeded()
            }
        }
    }

    override func viewDidLayoutSubviews() {
        searchBar.frame.size.width = collectionView.frame.width
    }

    /// Updated the view layout and adds months list and search bar
    func updateLayout() {
        let layout: UICollectionViewFlowLayout = (collectionView.collectionViewLayout as! UICollectionViewFlowLayout)

        layout.itemSize.width = {
            let screenRect = UIScreen.mainScreen().bounds
            let width = screenRect.width / 7
            return width
            }()
        layout.minimumInteritemSpacing = 0.0
        layout.minimumLineSpacing = 0.0
        self.addMonths()
        self.addSearchBar()
    }

    /// Adds search bar to collection view
    private func addSearchBar() {
        searchBar = UISearchBar(frame: CGRect(x: 0, y: -searchBarHeight, width: collectionView.frame.width, height: searchBarHeight))
        currentSearchOffset = collectionView.contentOffset.y
        self.collectionView.addSubview(searchBar)
    }

    /// Adds the month label when collection view is being scrolled
    private func addMonths() {

        monthStackView.hidden = true
        monthStackView.axis = .Vertical
        monthStackView.distribution = .EqualSpacing
        monthStackView.alignment = .Center

        var eachDate = NSDate.startMonth
        var longGap = false
        while eachDate.compare(NSDate.endDate) == NSComparisonResult.OrderedAscending {
            let cellMltiplier = longGap ? 3.0 : 5.0
            monthStackView.addArrangedSubview(UILabel(text: eachDate.monthToString(), height: CGFloat(cellHeight * cellMltiplier)))

            let lastDate = eachDate.dateBySubtractingDays(1).dateAtTheStartOfMonth().dateAtStartOfWeek()
            let thisDate = eachDate.dateAtStartOfWeek()

//            log.info("\(eachDate.log)  [\(lastDate.log) \(thisDate.log)]  \(lastDate.daysBeforeDate(thisDate) / 7) ")

            longGap = Int(lastDate.daysBeforeDate(thisDate) / 7) == 5
            eachDate = eachDate.dateByAddingMonths(1)
        }

        monthStackView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.addSubview(monthStackView)

        monthStackView.leadingAnchor.constraintEqualToAnchor(collectionView.leadingAnchor).active = true
        monthStackView.topAnchor.constraintEqualToAnchor(collectionView.topAnchor).active = true
        monthStackView.widthAnchor.constraintEqualToAnchor(collectionView.widthAnchor).active = true

    }

    /// Programatically selects date
    func notifySelectedDateChangedToDate(date: NSDate, animated: Bool) {
        let delta = NSDate.startDate.daysBeforeDate(date)
        let indexPath = NSIndexPath(forItem: delta, inSection: 0)
        collectionView.selectItemAtIndexPath(indexPath, animated: false, scrollPosition: .CenteredVertically)
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: .Top, animated: animated)
    }
}

//MARK: UICollectionViewDataSource
extension CalenderViewController: UICollectionViewDataSource {

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    /// Returns delta of startdate and endDate
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

//MARK: UICollectionViewDelegate
extension CalenderViewController: UICollectionViewDelegate {

    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! DateCell
        (self.parentViewController as! ViewController).tableViewController.notifySelectedDateChangedToDate(cell.dateSource, animated: true)
        compressHeight = false
    }

    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        self.compressHeight = false
    }

    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        self.blurCalendar = false
    }

    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        self.blurCalendar = false
    }

    func scrollViewDidScroll(scrollView: UIScrollView) {
        self.blurCalendar = true

        if currentSearchOffset < collectionView.contentOffset.y {
            if (collectionView.contentOffset.y - searchBar.frame.origin.y) > searchBarHeight {
                searchBar.frame.origin.y = collectionView.contentOffset.y - searchBarHeight
            }
        } else {
            if (collectionView.contentOffset.y - searchBar.frame.origin.y) < 0 {
                searchBar.frame.origin.y = collectionView.contentOffset.y
            }
        }

        currentSearchOffset = collectionView.contentOffset.y
    }
}

private extension UILabel {
    /// Label for Month View only
    convenience init(text: String, height: CGFloat) {
        self.init(frame: CGRect())
        self.text = text
        self.font = UIFont.boldSystemFontOfSize(25)
        self.sizeToFit()
        self.textAlignment = .Center
        self.translatesAutoresizingMaskIntoConstraints = false
        let heightConstraint = self.heightAnchor.constraintEqualToAnchor(nil, constant: height)
        NSLayoutConstraint.activateConstraints([heightConstraint])
    }
}
