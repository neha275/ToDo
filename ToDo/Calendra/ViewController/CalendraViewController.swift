//
//  CalendraViewController.swift
//  ToDo
//
//  Created by Neha Gupta on 03/05/21.
//

import UIKit

class CalendraViewController: UIViewController {

    @IBOutlet weak var dtCalendar:UIDatePicker!
    @IBOutlet weak var tblTaskList:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblTaskList.isHidden = true
    }

    @IBAction func onDateTap(_ sender: Any) {
        
    }
}

extension CalendraViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 47
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CalendraTaskTableViewCell", for: indexPath) as! CalendraTaskTableViewCell
        return cell
    }
}
