//
//  CardView.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/16/22.
//

import Foundation
import UIKit

class CardView: UIView {}

extension CardView {
    func roundCorners(corners: UIRectCorner, cornerRadii: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii:CGSize(width: cornerRadii, height: cornerRadii))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = self.bounds
        maskLayer.path = maskPath.cgPath
        self.layer.mask = maskLayer
    }
    
    func roundCorners(top: Bool, cornerRadii: CGFloat){
        let corners: UIRectCorner = top ? [.topLeft , .topRight] : [.bottomRight , .bottomLeft]
        roundCorners(corners: corners, cornerRadii: cornerRadii)
    }
    
    func roundAllCorners(cornerRadii: CGFloat) {
        let corners: UIRectCorner = .allCorners
        roundCorners(corners: corners, cornerRadii: cornerRadii)
    }
}
