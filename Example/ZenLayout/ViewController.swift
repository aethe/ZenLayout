//
//  ViewController.swift
//  ZenLayout
//
//  Created by aethe on 08/27/2015.
//  Copyright (c) 2015 aethe. All rights reserved.
//

import UIKit
import ZenLayout

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let label = UILabel()
        label.text = "It's working!"
        view.addSubview(label)
        
        view.addConstraint(label.centerX == view.centerX)
        view.addConstraint(label.centerY == view.centerY)
    }

}

