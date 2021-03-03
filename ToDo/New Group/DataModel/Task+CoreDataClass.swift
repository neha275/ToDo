//
//  Task+CoreDataClass.swift
//  
//
//  Created by Neha Gupta on 04/03/21.
//
//

import Foundation
import CoreData
import UIKit

@objc(Task)
public class Task: NSManagedObject {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveTask(name: String, description: String, date:Date) {
        
    }
}
