//
//  File.swift
//  
//
//  Created by Simon Kim on 2020/01/05.
//

import UIKit

extension CAShapeLayer {
    
    public convenience init(antsWithPath path: CGPath, color: UIColor = .black, lineDashPattern: [Int] = [6, 8]) {
        self.init()
        self.path = path
        self.strokeColor = color.cgColor
        self.fillColor = nil
        self.lineDashPattern = lineDashPattern as [NSNumber]
        
        let animation = CABasicAnimation(keyPath: "lineDashPhase")
        animation.duration = 1.0
        animation.fromValue = 0
        animation.toValue = lineDashPattern.reduce(0) { $0 - $1 }
        animation.repeatCount = .infinity
        animation.autoreverses = false

        self.add(animation, forKey: "dash")
    }
    
    public convenience init(strokeWithPath path: CGPath, color: UIColor) {
        self.init()
        self.path = path
        self.strokeColor = color.cgColor
        self.fillColor = nil
    }
}
