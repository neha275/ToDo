//
//  Task+CoreDataProperties.swift
//  
//
//  Created by Neha Gupta on 04/03/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: Int64
    @NSManaged public var taskName: String?
    @NSManaged public var taskdescription: String?
    @NSManaged public var date: Date?
    @NSManaged public var status: Bool
    @NSManaged public var isDelete: Bool

}
