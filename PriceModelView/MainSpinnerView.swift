//
//  MainSpinnerView.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 08.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class MainSpinnerView: UIView {
    
    lazy var spinnerLayer = CAShapeLayer()
    
    func addSpinner() {
        
        let spinnerView = UIView(frame: bounds)
        spinnerView.backgroundColor = UIColor.clear
        
        //addSubview(spinnerView)
        //sendSubview(toBack: spinnerView)
        insertSubview(spinnerView, at: 1)
        
        let startAngle = 6.8 * M_PI / 6
        let spinnerPath = UIBezierPath(arcCenter: spinnerView.center, radius: spinnerView.bounds.width / 2, startAngle: CGFloat(startAngle), endAngle: CGFloat(startAngle - 2 * M_PI), clockwise: false)
        
        spinnerLayer.path = spinnerPath.cgPath
        spinnerLayer.strokeEnd = 1.0
        spinnerLayer.fillColor = UIColor.clear.cgColor
        spinnerLayer.lineWidth = spinnerView.bounds.width / 2
        //spinnerLayer.strokeColor = UIColor(red: 1, green: 180/255, blue: 0, alpha: 1).cgColor
        spinnerLayer.strokeColor = UIColor.white.cgColor
        
        spinnerView.layer.addSublayer(spinnerLayer)
    }
    
    func animate(_ duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 1
        animation.toValue = 0
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        spinnerLayer.strokeEnd = 0.0
        spinnerLayer.add(animation, forKey: "animateStorkeEnd")
    }
}
