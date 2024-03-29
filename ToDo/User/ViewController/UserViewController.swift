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
    
    func redirectToDashboard() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(identifier: "DashboardViewController") as DashboardViewController
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
    }
    
    func saveUserData(name:String, email:String) {
        let objUser:User = User()
        let result = objUser.saveData(name: name , email: email )
        if result.0 {
           redirectToDashboard()
        }else {
            Toast.showToast(controller: self, message: result.1)
        }
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
        /*let userId = user.userID                  // For client-side use only!
        //print("Google User Id:\(String(describing: userId))")
        //let idToken = user.authentication.idToken // Safe to send to the server
        //print("Login Token:\(String(describing: idToken))")
        //let userGivenName= user.profile.givenName
        //let familyName = user.profile.familyName
        */
        let fullName = user.profile.name!
        //print("Full Name: \(String(describing: fullName))")
        let email = user.profile.email!
        //print("Email: \(String(describing: email))")
        saveUserData(name: fullName , email: email )
    }
}

