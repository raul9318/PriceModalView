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
    
    func addSpinner(withDuration duration: TimeInterval) {
        
        let spinnerView = UIView(frame: bounds)
        spinnerView.backgroundColor = UIColor.clear
        
        addSubview(spinnerView)
        sendSubview(toBack: spinnerView)
        
        let startAngle = 4 * M_PI / 3
        let spinnerPath = UIBezierPath(arcCenter: spinnerView.center, radius: spinnerView.bounds.width / 2, startAngle: CGFloat(startAngle), endAngle: CGFloat(startAngle + 2 * M_PI), clockwise: true)
        
        spinnerLayer.path = spinnerPath.cgPath
        spinnerLayer.strokeEnd = 0.0
        spinnerLayer.fillColor = UIColor.clear.cgColor
        spinnerLayer.lineWidth = spinnerView.bounds.width / 2
        spinnerLayer.strokeColor = UIColor(red: 1, green: 180/255, blue: 0, alpha: 1).cgColor
        
        spinnerView.layer.addSublayer(spinnerLayer)
        
        animate(duration)
    }
    
    private func animate(_ duration: TimeInterval) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = 1
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        spinnerLayer.add(animation, forKey: "animateStorkeEnd")
        spinnerLayer.strokeEnd = 1.0
    }
}
