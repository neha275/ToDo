//
//  MainViewController.swift
//  ToDo
//
//  Created by Neha Gupta on 09/03/21.
//

import UIKit

class MainViewController: UIViewController {

    //MARK: IBOutelt
    @IBOutlet weak var tblTaskList:UITableView!
    @IBOutlet weak var imgNoTaskFound:UIImageView!
    
    //MARK: - Variable and Constant Decelration
    var taskList:[Task]!
    var refreshControl = UIRefreshControl()
    var isFresh:Bool = false
    let formatter =  DateFormatter()
    let kDateFormat = "dd/MM/yyyy"
    
    //MARK: - View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = kDateFormat
        tblTaskList.delegate = self
        tblTaskList.dataSource = self
        addRefreshControl()
        fetchAllData()
    }
    
    

    //MARK: - Fetch data
    
    func fetchAllData() {
        let objTaskDataModel = Task()
        let result = objTaskDataModel.getallTaskList()
        if result.status ==  NetworkHelper.RequestStatus.Success.rawValue {
            taskList = result.collection
            checkDataStatus()
        }else {
            Toast.showToast(controller: self, message: result.errorMsg)
        }
        
    }
    
    func checkDataStatus() {
        if taskList.count > 0 {
            tblTaskList.reloadData()
            tblTaskList.isHidden = false
            imgNoTaskFound.isHidden = true
        }else {
            tblTaskList.isHidden = true
            imgNoTaskFound.isHidden = false
        }
        if isFresh {
            refreshControl.endRefreshing()
        }
    }
    
    //MARK: - Refresh Data
    func addRefreshControl() {
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
        tblTaskList.addSubview(refreshControl)
    }
    
    @objc func refresh(_ sender: AnyObject) {
        isFresh = true
        fetchAllData()
        
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddViewController" {
            let addViewContoller:AddViewController = segue.destination as! AddViewController
            addViewContoller.refreshTaskTableView = self
        }
    }
    

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskListTableViewCell", for: indexPath) as! TaskListTableViewCell
        let task = taskList[indexPath.row]
        cell.lblId.text = "\(task.id)"
        cell.lblTaskName.text = task.taskName
        cell.lblDescription.text = task.taskdescription
        cell.lblDate.text = formatter.string(from: task.date ?? Date())

        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 80
        return UITableView.automaticDimension
    }
    
    
}

extension MainViewController : UpdateMainView {
    func refreshTableViewWithNewData() {
        self.fetchAllData()
        self.tblTaskList.reloadData()
    }
    
    
}
