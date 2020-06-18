//
//  CustomizedTabBar.swift
//  customTabbar
//
//  Created by Deepika on 18/06/20.
//  Copyright © 2020 Deepika. All rights reserved.
//

import UIKit

class CustomizedTabBar: UITabBar {

    private var shapeLayer: CALayer?
    
    override func draw(_ rect: CGRect) {
        
    }
    
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = createPath()
        shapeLayer.strokeColor = UIColor.lightGray.cgColor
        shapeLayer.fillColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 1
        
        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }
        
        self.shapeLayer = shapeLayer
    }
    
    private func createPath() -> CGPath {
        
        let height: CGFloat = 37
        let path = UIBezierPath()
        let centerWidth = self.frame.width / 2
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: 0, y: 0))
        
        
        //first curve down
        path.addCurve(to: CGPoint(x: centerWidth, y: height), controlPoint1: CGPoint(x: centerWidth - 30, y: 0), controlPoint2: CGPoint(x: centerWidth - 35, y: height))
        
        //second curve up
        path.addCurve(to: CGPoint(x: centerWidth + height * 2, y: 0), controlPoint1: CGPoint(x: centerWidth - 35, y: height), controlPoint2: CGPoint(x: centerWidth + 30, y: 0))
        //complete the rect
        path.addLine(to: CGPoint(x: self.frame.width, y: 0))
        path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
        path.addLine(to: CGPoint(x: 0, y: self.frame.height))
        path.close()
        
        return path.cgPath
    }
    
}
