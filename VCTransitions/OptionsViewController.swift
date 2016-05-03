//
//  OptionsViewController.swift
//  VCTransitions
//
//  Created by wuqh on 16/5/3.
//  Copyright © 2016年 wuqh. All rights reserved.
//

import UIKit

class OptionsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    
    // MARK: - Action
    @IBAction func doneButtonClick(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }


}
