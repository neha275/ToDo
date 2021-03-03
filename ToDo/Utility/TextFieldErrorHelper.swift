//
//  TextFieldErrorHelper.swift
//  ToDo
//
//  Created by Neha Gupta on 03/03/21.
//

import UIKit

class TextFieldErrorHelper {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

extension UITextField {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
            let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
            animation.fromValue = baseColor
            animation.toValue = UIColor.red.cgColor
            animation.duration = 0.4
            if revert { animation.autoreverses = true } else { animation.autoreverses = false }
            self.layer.add(animation, forKey: "")

            let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
            shake.duration = 0.07
            shake.repeatCount = shakes
            if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
            shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
            shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
            self.layer.add(shake, forKey: "position")
        }
    
    func setErrorBorderOnlyWith(color: CGColor) {
        
        self.layer.borderColor = color
        self.layer.borderWidth = 2.0
        /*self.borderStyle = .none
        self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0*/
    }
    
}

extension UITextView {
    func isError(baseColor: CGColor, numberOfShakes shakes: Float, revert: Bool) {
        let animation: CABasicAnimation = CABasicAnimation(keyPath: "shadowColor")
        animation.fromValue = baseColor
        animation.toValue = UIColor.red.cgColor
        animation.duration = 0.4
        if revert { animation.autoreverses = true } else { animation.autoreverses = false }
        self.layer.add(animation, forKey: "")
        
        let shake: CABasicAnimation = CABasicAnimation(keyPath: "position")
        shake.duration = 0.07
        shake.repeatCount = shakes
        if revert { shake.autoreverses = true  } else { shake.autoreverses = false }
        shake.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 10, y: self.center.y))
        shake.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 10, y: self.center.y))
        self.layer.add(shake, forKey: "position")
    }
    
    func setErrorBorderOnlyWith(color: CGColor) {
        
        self.layer.borderColor = color
        self.layer.borderWidth = 2.0
        
        /*self.layer.masksToBounds = false
        self.layer.shadowColor = color
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0*/
    }
}
