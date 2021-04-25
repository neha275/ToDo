//
//  TaskStatus+CoreDataProperties.swift
//  
//
//  Created by Neha Gupta on 25/04/21.
//
//

import Foundation
import CoreData


extension TaskStatus {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskStatus> {
        return NSFetchRequest<TaskStatus>(entityName: "TaskStatus")
    }

    @NSManaged public var taskId: Int64
    @NSManaged public var statusId: Int64
    @NSManaged public var status: Bool
    @NSManaged public var isDelete: Bool

}
