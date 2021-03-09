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
    let formatter =  DateFormatter()
    let kDateFormat = "dd/MM/yyyy"
    
    //MARK: - View Controller life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        formatter.dateFormat = kDateFormat
        fetchAllData()
        
        // Do any additional setup after loading the view.
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
            tblTaskList.isHidden = true
            imgNoTaskFound.isHidden = false
        }else {
            tblTaskList.isHidden = false
            imgNoTaskFound.isHidden = true
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
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
            tableView.estimatedRowHeight = 130
        return UITableView.automaticDimension
        }
    
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text

        label.sizeToFit()
        return label.frame.height
    }
}
