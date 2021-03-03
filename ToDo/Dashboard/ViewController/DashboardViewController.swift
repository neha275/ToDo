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
        redirectToAddViewController()
    }
    
    //MARK: - Set Redirection to Add View Controller
    func redirectToAddViewController(){
        if let customTabbar = tabBar as? STTabbar {
            customTabbar.centerButtonActionHandler = {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(identifier: "AddViewController") as AddViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            
        }
    }
}



