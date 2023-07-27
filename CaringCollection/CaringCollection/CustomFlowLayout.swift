//
//  CustomFlowLayout.swift
//  CaringCollection
//
//  Created by Vyacheslav Pronin on 27.07.2023.
//

import UIKit

final class CustomFlowLayout: UICollectionViewFlowLayout {

    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint,
                                      withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset,
                                             withScrollingVelocity: velocity)
        }

        let pageWidth = itemSize.width + minimumInteritemSpacing
        let approximatePage = collectionView.contentOffset.x / pageWidth
        let currentPage = velocity.x.isZero ? round(approximatePage) :
                                              (velocity.x < .zero ?
                                                floor(approximatePage) :
                                                ceil(approximatePage))
        let flickedPages = (abs(round(velocity.x)) <= 1) ? .zero : round(velocity.x)
        let newHorizontalOffset = ((currentPage + flickedPages) * pageWidth) - collectionView.contentInset.left

        return CGPoint(x: newHorizontalOffset, y: proposedContentOffset.y)
    }
}
