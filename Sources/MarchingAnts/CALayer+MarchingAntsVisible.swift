//
//  File.swift
//  
//
//  Created by Simon Kim on 2020/01/05.
//

import UIKit

extension Sequence where Element == CALayer {

    func marchingAntsLayer() -> CALayer? {
        for (_, sublayer) in enumerated() {
            if sublayer is MarchingAntsLayer {
                return sublayer
            }
        }
        return nil
    }
}

extension CALayer {
    public var isMarchingAntsVisible: Bool {
        get {
            sublayers?.marchingAntsLayer() != nil
        }
        
        set(visible) {
            
            let antsLayer = sublayers?.marchingAntsLayer()
            
            if !visible {
                if let antsLayer = antsLayer {
                    antsLayer.removeFromSuperlayer()
                }
                return
            }
            
            if antsLayer != nil {
                return
            }

            addSublayer(
                MarchingAnts().boundingAnts(rect: bounds)
            )
        }
    }
}
