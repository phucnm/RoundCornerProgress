//
//  UIView+RoundCorner.swift
//  RoundCornerProgressView
//
//  Created by Chi-Quyen Le on 12/10/16.
//  Copyright © 2016 Phuc Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    func roundCorner(roundingCorners: UIRectCorner, cornerRadius: CGSize) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: roundingCorners, cornerRadii: cornerRadius)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        layer.mask = maskLayer
    }
}
