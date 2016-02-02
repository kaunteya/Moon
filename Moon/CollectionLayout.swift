//
//  CollectionLayout.swift
//  Moon
//
//  Created by Kaunteya Suryawanshi on 02/02/16.
//  Copyright © 2016 Kaunteya Suryawanshi. All rights reserved.
//

import UIKit

class KSLayout: UICollectionViewFlowLayout {

    override func targetContentOffsetForProposedContentOffset(proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {

        let offset = self.itemSize.height

        var newOffset = proposedContentOffset.y % offset
        if newOffset <= offset / 2 {
            newOffset = proposedContentOffset.y - newOffset
        } else {
            newOffset = proposedContentOffset.y + offset - newOffset
        }
        return CGPoint(x: proposedContentOffset.x, y: newOffset)
    }
}
