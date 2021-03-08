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
    
    func saveTask(name: String, description: String, date:Date) -> (Int, String) {
        let newTask = Task(context: context)
        let id = getLastId()
        setTaskId(id: id)
        newTask.id = id
        newTask.taskName = name
        newTask.taskdescription = description
        newTask.date = date
        do {
            try context.save()
            return (NetworkHelper.RequestStatus.Success.rawValue, "")
        }catch {
            return (  NetworkHelper.RequestStatus.Fail.rawValue,  "Unable to save data \(error.localizedDescription)")
        }
        
        
    }
    
    fileprivate func getLastId() -> Int64 {
        let objUserDefault = UserDefaults.standard
        if let userID =  objUserDefault.value(forKey: "TaskId") as? Int64 {
            print(userID + 1)
            return userID + 1
        }
        return 1
    }
    
    fileprivate func setTaskId(id: Int64) {
        let objUserDefault = UserDefaults.standard
        objUserDefault.setValue(id, forKey: "TaskId")
        objUserDefault.synchronize()
    }
    
    func getallTaskList() -> (collection:[Task],status:Int,errorMsg:String) {
        let request = Task.fetchRequest() as NSFetchRequest<Task>
        var allData:[Task] = [Task]()
        var errorMsg:String = String()
        var status: Int = NetworkHelper.RequestStatus.Success.rawValue
        do {
            allData = try context.fetch(request)
            status = NetworkHelper.RequestStatus.Success.rawValue
        }catch{
            status = NetworkHelper.RequestStatus.Fail.rawValue
            errorMsg = error.localizedDescription
        }
        return(allData, status,errorMsg)
    }
    
    func updateTaskBy(task:Task) -> (Int, String) {
        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        let predicate =  NSPredicate(format: "(id = %@)", (task.id))
        fetchRequest.predicate = predicate
        do {
            let result = try context.fetch(fetchRequest)
            let previousTask = result[0] as Task
            previousTask.taskName = task.taskName
            previousTask.taskdescription = task.taskdescription
            previousTask.date = task.date
            
            try context.save()
        }catch{
            return (NetworkHelper.RequestStatus.Fail.rawValue,error.localizedDescription)
        }
        return (NetworkHelper.RequestStatus.Success.rawValue,"")
    }
    
    
}
