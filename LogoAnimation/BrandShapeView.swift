//
//  BrandShapeView.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-25.
//

import SwiftUI
import Foundation

struct BrandShapeView: Shape {
    
    let path: UIBezierPath
    let pathBounds: CGRect
    
//    func path(in rect: CGRect) -> Path {
//        let screenResolution = (rect.width >= rect.height) ?
//            max(pathBounds.height, pathBounds.width) :
//            min(pathBounds.height, pathBounds.width)
//
//        let pointTransform = CGAffineTransform(scaleX: 1/screenResolution, y: 1/screenResolution)
//        let newPath = Path(path.cgPath).applying(pointTransform)
//        let multiplier = min(rect.height, rect.width)
//        let transform = CGAffineTransform(scaleX: multiplier, y: multiplier)
//        return newPath.applying(transform)
//    }
    
    func path(in rect: CGRect) -> Path {
        let multiplier = min(rect.width, rect.height)
        let scaleFactor = (rect.width >= rect.height) ?
                    max(pathBounds.height, pathBounds.width) :
                    min(pathBounds.height, pathBounds.width)
        let factor = multiplier/scaleFactor
        let transform1 = CGAffineTransform(scaleX: factor, y: factor)
        let newX = (rect.origin.x - (pathBounds.origin.x))
        let newY = (rect.origin.y - (pathBounds.origin.y))
        print("newX == \(newX)")
        print("newY == \(newY)")
        let transform2 = CGAffineTransform(translationX: newX, y: newY)
       
        let newPath = Path(path.cgPath).applying(transform2)
        
        return newPath.applying(transform1)
    }
}

extension CGRect {
    var center: CGPoint { return CGPoint(x: midX, y: midY) }
}
