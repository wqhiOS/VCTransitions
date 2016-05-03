//
//  BaseAnimation.swift
//  VCTransitions
//
//  Created by wuqh on 16/5/3.
//  Copyright © 2016年 wuqh. All rights reserved.
//

import UIKit

public enum AnimationType : Int {
    
    case Present
    case Dismiss
}

class BaseAnimation: NSObject, UIViewControllerAnimatedTransitioning{
    
    var type: AnimationType?
    
    // MARK: - UIViewControllerAnimatedTransitioning
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 1.0
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
    }

}
