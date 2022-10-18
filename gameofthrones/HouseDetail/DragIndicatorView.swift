//
//  DragIndicatorView.swift
//  gameofthrones
//
//  Created by MacBook Pro on 10/18/22.
//

import Foundation
import UIKit

class DragIndicatorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func initialize() {
        backgroundColor = UIColor.black.withAlphaComponent(0.5)
        alpha = 0.3
        layer.cornerRadius = 2.5
    }
}
