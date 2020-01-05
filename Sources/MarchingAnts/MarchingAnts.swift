//
//  File.swift
//  
//
//  Created by Simon Kim on 2020/01/05.
//

import UIKit

public struct MarchingAnts {
    let antColor: UIColor
    let strokeColor: UIColor
    
    let lineDashPattern: [Int] = [6, 8]
    
    public init(antColor: UIColor = .black, strokeColor: UIColor = .white) {
        self.antColor = antColor
        self.strokeColor = strokeColor
    }
    
    public func boundingAnts(rect: CGRect) -> CALayer {
        return animatingAnts(path: UIBezierPath(rect: rect).cgPath)
    }
    
    public func animatingAnts(path: CGPath) -> CALayer {
        let layer = CALayer()
        layer.addSublayer(
            CAShapeLayer(strokeWithPath: path, color: strokeColor)
        )
        layer.addSublayer(
            CAShapeLayer(antsWithPath: path, color: antColor, lineDashPattern: lineDashPattern)
        )
        return layer
    }
}
