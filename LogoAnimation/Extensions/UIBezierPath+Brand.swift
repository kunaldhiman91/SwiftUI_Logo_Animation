//
//  UIBezierPath+Brand.swift
//  LogoAnimation
//
//  Created by Kunal Kumar on 2021-02-26.
//

import UIKit

extension UIBezierPath {
    
    static func generateBoundsFromPaths(paths: [UIBezierPath]) -> CGRect {
        let completePath: UIBezierPath = UIBezierPath()
        for path in paths {
            completePath.append(path)
        }
        return completePath.bounds
    }
    
    static var brandPath: UIBezierPath {
        let shape = UIBezierPath()
        shape.move(to: CGPoint(x: 161.78, y: 53.82))
        shape.addCurve(to: CGPoint(x: 101.36, y: 166.32), controlPoint1: CGPoint(x: 113.77, y: 70.25), controlPoint2: CGPoint(x: 88.72, y: 116.9))
        shape.addCurve(to: CGPoint(x: 109.24, y: 176.58), controlPoint1: CGPoint(x: 105.66, y: 183.15), controlPoint2: CGPoint(x: 107.58, y: 185.65))
        shape.addCurve(to: CGPoint(x: 160.2, y: 113.18), controlPoint1: CGPoint(x: 113.58, y: 152.82), controlPoint2: CGPoint(x: 136.17, y: 124.71))
        shape.addCurve(to: CGPoint(x: 241.78, y: 103.04), controlPoint1: CGPoint(x: 178.19, y: 104.54), controlPoint2: CGPoint(x: 189.33, y: 103.15))
        shape.addLine(to: CGPoint(x: 287.11, y: 102.94))
        shape.addLine(to: CGPoint(x: 309.96, y: 77.69))
        shape.addLine(to: CGPoint(x: 332.8, y: 52.44))
        shape.addLine(to: CGPoint(x: 321.51, y: 51.32))
        shape.addCurve(to: CGPoint(x: 161.78, y: 53.82), controlPoint1: CGPoint(x: 288.01, y: 47.98), controlPoint2: CGPoint(x: 173.62, y: 49.77))
        shape.move(to: CGPoint(x: 181.33, y: 125.4))
        shape.addCurve(to: CGPoint(x: 158.82, y: 259.68), controlPoint1: CGPoint(x: 120.07, y: 142.51), controlPoint2: CGPoint(x: 106.31, y: 224.61))
        shape.addCurve(to: CGPoint(x: 275.56, y: 198.25), controlPoint1: CGPoint(x: 208.62, y: 292.92), controlPoint2: CGPoint(x: 275.56, y: 257.7))
        shape.addCurve(to: CGPoint(x: 181.33, y: 125.4), controlPoint1: CGPoint(x: 275.56, y: 149.27), controlPoint2: CGPoint(x: 227.87, y: 112.41))
        shape.move(to: CGPoint(x: 294.59, y: 215.11))
        shape.addCurve(to: CGPoint(x: 290.79, y: 226.67), controlPoint1: CGPoint(x: 294.05, y: 216.58), controlPoint2: CGPoint(x: 292.34, y: 221.78))
        shape.addCurve(to: CGPoint(x: 231.31, y: 287.33), controlPoint1: CGPoint(x: 282.01, y: 254.36), controlPoint2: CGPoint(x: 259.4, y: 277.42))
        shape.addCurve(to: CGPoint(x: 167.97, y: 291.52), controlPoint1: CGPoint(x: 220.04, y: 291.31), controlPoint2: CGPoint(x: 217.43, y: 291.48))
        shape.addLine(to: CGPoint(x: 116.39, y: 291.56))
        shape.addLine(to: CGPoint(x: 92.64, y: 317.78))
        shape.addLine(to: CGPoint(x: 68.89, y: 344))
        shape.addLine(to: CGPoint(x: 91.78, y: 345.13))
        shape.addCurve(to: CGPoint(x: 231.47, y: 344.7), controlPoint1: CGPoint(x: 131.51, y: 347.09), controlPoint2: CGPoint(x: 221.32, y: 346.82))
        shape.addCurve(to: CGPoint(x: 303.45, y: 249.1), controlPoint1: CGPoint(x: 275.18, y: 335.59), controlPoint2: CGPoint(x: 306.44, y: 294.08))
        shape.addCurve(to: CGPoint(x: 294.59, y: 215.11), controlPoint1: CGPoint(x: 302.41, y: 233.39), controlPoint2: CGPoint(x: 296.38, y: 210.25))
        return shape
    }
}
