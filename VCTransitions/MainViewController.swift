//
//  MainViewController.swift
//  VCTransitions
//
//  Created by wuqh on 16/5/3.
//  Copyright © 2016年 wuqh. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController, UIViewControllerTransitioningDelegate {
    
    var modalAnimationHandle:ModalAnimation = ModalAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let vc = ImageViewViewController()
      
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: - Action
    
    @IBAction func optionsButtonClick(sender: AnyObject) {
        let vc = OptionsViewController()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(vc, animated: true, completion: nil)
    }

     // MARK: - UIViewControllerTransitioningDelegate
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        modalAnimationHandle.type = AnimationType.Present
        return modalAnimationHandle
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        modalAnimationHandle.type = AnimationType.Dismiss
        return modalAnimationHandle
    }
}


    