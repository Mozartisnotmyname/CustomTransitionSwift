//
//  CustomTransition.swift
//  CustomTransitionSwift
//
//  Created by 凌       陈 on 12/4/17.
//  Copyright © 2017 凌       陈. All rights reserved.
//

import UIKit


class CustomTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.35
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from)
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        let containerView = transitionContext.containerView
        
        var fromView = fromViewController?.view
        var toView = toViewController?.view
        
        // 如果presentViewController等于fromViewController，是执行了present
        // 如果presentViewController不等于fromViewController，是执行了dismiss
        let isPresenting = (toViewController?.presentingViewController == fromViewController)
        
        // 根据当前是dismiss还是present，横屏还是竖屏，计算好toView的初始位置以及结束位置
        if isPresenting {
            
            fromView?.transform    = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform      = CGAffineTransform(translationX: UIScreen.main.bounds.size.width, y: 0)
            let transitionDuration = self.transitionDuration(using: transitionContext)
            
            // 开始动画
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView?.transform = CGAffineTransform(translationX: -UIScreen.main.bounds.size.width, y: 0)
                toView?.transform   = CGAffineTransform(translationX: 0, y: 0)
               
            }) { (finished: Bool) -> Void in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
        } else {
           
            fromView?.transform    = CGAffineTransform(translationX: 0, y: 0)
            toView?.transform      = CGAffineTransform(translationX: -UIScreen.main.bounds.size.width, y: 0)
            let transitionDuration = self.transitionDuration(using: transitionContext)
            
            // 开始动画
            UIView.animate(withDuration: transitionDuration, animations: {
                fromView?.transform = CGAffineTransform(translationX: UIScreen.main.bounds.size.width, y: 0)
                toView?.transform   = CGAffineTransform(translationX: 0, y: 0)
                
            }) { (finished: Bool) -> Void in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
            
        }
        
        if transitionContext.responds(to: Selector("viewForKey:")) {
            fromView = transitionContext.view(forKey: UITransitionContextViewKey.from)
            toView = transitionContext.view(forKey: UITransitionContextViewKey.to)
        }
    
        containerView.addSubview(toView!)
    }

}
