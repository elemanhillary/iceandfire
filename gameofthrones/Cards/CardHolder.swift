//
//  CardHolder.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class CardHolder: UIView {
    let topView = UIView()
    let cardView1 = CardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Not yet implemented")
    }
    
    private func initialize() {
        self.addSubviews()
    }
    
    private func addSubviews() {
        addSubview(topView)
        addSubview(cardView1)
        cardView1.backgroundColor = .white
        let screenBounds = UIScreen.main.bounds
        cardView1.frame = CGRect(x: 0, y: screenBounds.maxY - (screenBounds.maxY - Constants.openedCardViewHeight), width: screenBounds.width, height: screenBounds.maxY - Constants.openedCardViewHeight)
        topView.frame = CGRect(x: 0, y: 0, width: screenBounds.width, height: cardView1.frame.minY + Constants.subviewBottomOffset)
        cardView1.roundCorners(top: true, cornerRadii: Constants.cardTopCornerRadius)
        setNeedsLayout()
    }
}


extension CardHolder {
    struct Constants {
        static let openedCardViewHeight: CGFloat = 200
        static let cardTopCornerRadius: CGFloat = 10
        static let subviewBottomOffset: CGFloat = 40
        static let minCardTopMargin: CGFloat = 88
    }
}
