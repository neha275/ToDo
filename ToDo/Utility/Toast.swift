//
//  Toast.swift
//  ToDo
//
//  Created by Neha Gupta on 24/02/21.
//

import UIKit

class Toast {
//    static func showToast(controller: UIViewController, message : String, seconds: Double) {
//        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
//        alert.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
//        alert.view.alpha = 1.0
//        alert.view.layer.cornerRadius = 1013
//        controller.present(alert, animated: true)
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
//            alert.dismiss(animated: true)
//        }
//    }
    
   static func showToast(controller: UIViewController,message : String) {
        let toastLabel = UILabel(frame: CGRect(x: controller.view.frame.size.width/2 - 75, y: controller.view.frame.size.height-100, width: 150, height: 35))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.lineBreakMode = .byWordWrapping
        toastLabel.numberOfLines = 3
        toastLabel.textAlignment = .center;
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        controller.view.addSubview(toastLabel)
        UIView.animate(withDuration: 4.0, delay: 1.0, options: .curveEaseOut, animations: {
             toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
    
