//
//  ModalPresentAnimationController.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class ModalPresentAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    private let marginTop: CGFloat = 76
    private let marginLeft: CGFloat = 12
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC: UIViewController = transitionContext.viewController(forKey: .from)!
        let toVC: UIViewController = transitionContext.viewController(forKey: .to)!
        let container = transitionContext.containerView
        
        // add snapshot of first screen
        let fromVCSnapchot = fromVC.view.snapshotView(afterScreenUpdates: false)
        fromVCSnapchot?.frame = fromVC.view.frame
        container.addSubview(fromVCSnapchot!)
        
        fromVC.view.removeFromSuperview()
        
        // add blur view
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = fromVCSnapchot!.frame
        blurView.alpha = 0
        container.addSubview(blurView)
        
        // add to vc view
        var finalFrame = transitionContext.finalFrame(for: toVC)
        finalFrame = CGRect(x: 0, y: 0, width: finalFrame.width - marginLeft * 2, height: finalFrame.height - marginTop - marginLeft)
        finalFrame = finalFrame.offsetBy(dx: marginLeft, dy: marginTop)
        
        let bounds = UIScreen.main.bounds
        toVC.view.frame = bounds.offsetBy(dx: 0, dy: bounds.height)
        toVC.view.layer.cornerRadius = 4
        toVC.view.clipsToBounds = true
        container.addSubview(toVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            toVC.view.frame = finalFrame
            blurView.alpha = 1
        }) { (complete) in
            transitionContext.completeTransition(true)
        }
        
    }
}
