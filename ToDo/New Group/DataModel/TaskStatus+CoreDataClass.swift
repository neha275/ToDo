//
//  TaskStatus+CoreDataClass.swift
//  
//
//  Created by Neha Gupta on 25/04/21.
//
//

import Foundation
import CoreData

@objc(TaskStatus)
public class TaskStatus: NSManagedObject {

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    func saveTaskStatus(taskId:Int64) -> (Int, String) {
        
        let newTaskStatus = TaskStatus(context: context)
        let id = getLastStatusId()
        setStatusTaskId(id: id)
        newTaskStatus.id = id
        newTaskStatus.taskId = taskId
        
        do {
            try context.save()
            return (NetworkHelper.RequestStatus.Success.rawValue, "")
        }catch {
            return (  NetworkHelper.RequestStatus.Fail.rawValue,  "Unable to save data \(error.localizedDescription)")
        }
        
        
    }
    
    fileprivate func getLastStatusId() -> Int64 {
        let objUserDefault = UserDefaults.standard
        if let statusID =  objUserDefault.value(forKey: "TaskStatusId") as? Int64 {
            return statusID + 1
        }
        return 1
    }
    
    fileprivate func setStatusTaskId(id: Int64) {
        let objUserDefault = UserDefaults.standard
        objUserDefault.setValue(id, forKey: "TaskStatusId")
        objUserDefault.synchronize()
    }
    
}
