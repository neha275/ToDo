//
//  UserViewController.swift
//  ToDo
//
//  Created by Neha Gupta on 24/02/21.
//

import UIKit
import GoogleSignIn

class UserViewController: UIViewController {
    
    
    @IBOutlet weak var btnGoogleSign: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.presentingViewController = self
    }
    
    @IBAction func googleSignIn(_ sender: Any) {
        GIDSignIn.sharedInstance()?.signIn()
        
    }
    

}


extension UserViewController :  GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                //print("The user has not signed in before or they have since signed out.")
                Toast.showToast(controller: self, message: "The user has not signed in before or they have since signed out.")
            } else {
                //print("\(error.localizedDescription)")
                Toast.showToast(controller: self, message: error.localizedDescription)
            }
            return
        }
        // Perform any operations on signed in user here.
        let userId = user.userID                  // For client-side use only!
        print("Google User Id:\(String(describing: userId))")
        let idToken = user.authentication.idToken // Safe to send to the server
        print("Login Token:\(String(describing: idToken))")
        let fullName = user.profile.name
        print("Full Name: \(String(describing: fullName))")
//        _ = user.profile.givenName
//        _ = user.profile.familyName
        let email = user.profile.email
        print("Email: \(String(describing: email))")
        
        
    }
}

