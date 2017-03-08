//
//  ModalDismissAnimationController.swift
//  PriceModelView
//
//  Created by Рамиль Ибрагимов on 07.03.17.
//  Copyright © 2017 Рамиль Ибрагимов. All rights reserved.
//

import UIKit

class ModalDismissAnimationController: NSObject, UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.4
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = transitionContext.viewController(forKey: .from)!
        let toVC = transitionContext.viewController(forKey: .to)!
        let container = transitionContext.containerView
        
        //container.clearsContextBeforeDrawing = true
        
        // to
        let finalFrame = transitionContext.finalFrame(for: toVC)
        toVC.view.frame = finalFrame
        container.addSubview(toVC.view)
        
        // blur
        let blurEffect = UIBlurEffect(style: .light)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.frame = finalFrame
        blurView.alpha = 1.0
        container.addSubview(blurView)
        
        // from
        container.addSubview(fromVC.view)
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), delay: 0.0, options: UIViewAnimationOptions.curveEaseIn, animations: {
            blurView.alpha = 0.0
            fromVC.view.frame = fromVC.view.frame.offsetBy(dx: 0, dy: UIScreen.main.bounds.height)
        }) { (complete) in
            blurView.removeFromSuperview()
            fromVC.view.removeFromSuperview()
            transitionContext.completeTransition(true)
        }
        
    }
}
