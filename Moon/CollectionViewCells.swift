//
//  CollectionViewCells.swift
//  CollectionTry
//
//  Created by Kaunteya Suryawanshi on 20/01/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//


import UIKit

class DateCell: UICollectionViewCell {
    @IBOutlet weak var textField: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.lightGrayColor()
    }
}

class FirstDayCell: UICollectionViewCell {
    @IBOutlet weak var month: UILabel!

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.lightGrayColor()
    }
}

