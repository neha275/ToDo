//
//  ViewController.swift
//  ToDo
//
//  Created by Neha Gupta on 23/02/21.
//

import UIKit
import STTabbar

class DashboardViewController: UITabBarController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        if let customTabbar = tabBar as? STTabbar {
            customTabbar.centerButtonActionHandler = {
                print("Center Button Tapped")
                
            }
            
        }
    }
}



