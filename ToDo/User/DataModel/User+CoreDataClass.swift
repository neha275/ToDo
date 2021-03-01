//
//  User+CoreDataClass.swift
//  ToDo
//
//  Created by Neha Gupta on 01/03/21.
//
//

import Foundation
import CoreData
import UIKit

@objc(User)
public class User: NSManagedObject {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
   
    
    func saveData(name:String, email:String) -> (Bool,String) {
        let newUser = User(context: context)
        newUser.email = email
        newUser.name = name
        
        do{
            try context.save()
        }catch{
            
            return (false,error.localizedDescription)
        }
        setUserName(name: name)
        return (true,"")
    }
    
    func fetchUserDetails() {
        
    }
    
    public func setUserName(name: String) {
        let objUserDefault = UserDefaults.standard
        objUserDefault.setValue(name, forKey: "UserName")
        objUserDefault.synchronize()
    }
    
    public func getUserName() -> String {
        let objUserDefault = UserDefaults.standard
        if let name =  objUserDefault.value(forKey: "UserName") as? String {
            print(name)
            return name
        }
        return "1"
    }
    
}
