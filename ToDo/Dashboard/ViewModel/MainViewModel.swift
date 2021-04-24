//
//  MainViewModel.swift
//  ToDo
//
//  Created by Neha Gupta on 23/04/21.
//

import UIKit


class MainViewModel {
    
    func deleteTask(taskDetails: Task) -> (Int,String) {
        let objTaskModel = Task()
        
        return objTaskModel.deleteTask(taskDetails: taskDetails)
    }
}
