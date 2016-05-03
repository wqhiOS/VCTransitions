//
//  ModalAnimation.swift
//  VCTransitions
//
//  Created by wuqh on 16/5/3.
//  Copyright © 2016年 wuqh. All rights reserved.
//

import UIKit

class ModalAnimation: BaseAnimation {
    
    override func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        var coverView:UIView?
        
        
        if type == AnimationType.Present {
            
            let modalView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
            if coverView == nil {
                coverView = UIView(frame: containerView!.frame)
                coverView?.backgroundColor = UIColor.init(white: 0.0, alpha: 0.6)
                coverView?.alpha = 0.0
            }else {
                coverView?.frame = (containerView?.frame)!
            }
            containerView?.addSubview(coverView!)
            containerView?.addSubview(modalView!)
            modalView?.snp_makeConstraints(closure: { (make) in
                make.top.left.equalTo(containerView!).offset(30)
                make.right.bottom.equalTo(containerView!).offset(-30)
            })
            
            let endFrame = modalView?.frame
            modalView?.frame = CGRectMake((endFrame?.origin.x)!, (containerView?.frame.size.height)!, (endFrame?.size.width)!, (endFrame?.size.height)!)
//            containerView?.bringSubviewToFront(modalView!)
            
            UIView.animateWithDuration(1.0, delay: 0.0, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .CurveLinear, animations: {
                modalView?.frame = endFrame!
                coverView?.alpha = 1.0
                }, completion: { (finished) in
                    transitionContext.completeTransition(finished)
            })
            
        }else {
            
            let modalView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
            
            let snapshot = modalView?.snapshotViewAfterScreenUpdates(false)
            snapshot?.frame = (modalView?.frame)!
            containerView?.addSubview(snapshot!)
            containerView?.bringSubviewToFront(snapshot!)
            modalView?.removeFromSuperview()
//
            let originalFrame = snapshot?.frame
            snapshot?.layer.anchorPoint = CGPointMake(0.0, 1.0)
            snapshot?.frame = originalFrame!
            
        
            
            UIView.animateKeyframesWithDuration(1.75, delay: 0.0, options: UIViewKeyframeAnimationOptions.CalculationModeLinear, animations: {
                UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.15, animations: { 
                    snapshot?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * (0.5))
                })
                UIView.addKeyframeWithRelativeStartTime(0.15, relativeDuration: 0.10, animations: {
                    snapshot?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * (1.0))
                })
                UIView.addKeyframeWithRelativeStartTime(0.25, relativeDuration: 0.20, animations: {
                    snapshot?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * 1.3)
                })
                UIView.addKeyframeWithRelativeStartTime(0.45, relativeDuration: 0.20, animations: {
                    snapshot?.transform = CGAffineTransformMakeRotation(CGFloat(M_PI) * 0.8)
                })
                UIView.addKeyframeWithRelativeStartTime(0.65, relativeDuration: 0.35, animations: {
                    let shift = CGAffineTransformMakeTranslation(180.0, 0.0)
                    let rotate = CGAffineTransformMakeRotation(CGFloat(M_PI) * 0.3)
                    snapshot?.transform = CGAffineTransformConcat(shift, rotate)
                    coverView?.alpha = 0.0
                })
                }, completion: { (finished) in
                    coverView?.removeFromSuperview()
              
                    containerView?.snp_removeConstraints()
                    transitionContext .completeTransition(true)
            })
            

            
        }
    }

}
