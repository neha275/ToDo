//
//  User+CoreDataProperties.swift
//  ToDo
//
//  Created by Neha Gupta on 01/03/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var name: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
