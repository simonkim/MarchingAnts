//
//  File.swift
//  
//
//  Created by Simon Kim on 2020/01/05.
//

import UIKit

class MarchingAntsLayer: CALayer {
    
}

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
        let layer = MarchingAntsLayer()
        
        let pair = antsShapeLayerPair(path: path)
        layer.addSublayer( pair.strokeLayer )
        layer.addSublayer( pair.antsLayer )
        
        return layer
    }
    
    /// Creates pair of shape layer achives marching ants effect together as sublayers of a parent
    public func antsShapeLayerPair(path: CGPath) -> ShapeLayerPair {
        return ShapeLayerPair(
            strokeLayer: CAShapeLayer(strokeWithPath: path, color: strokeColor),
            antsLayer: CAShapeLayer(antsWithPath: path, color: antColor, lineDashPattern: lineDashPattern)
        )
    }
}
