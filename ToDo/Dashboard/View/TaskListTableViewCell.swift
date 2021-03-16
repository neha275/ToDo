//
//  TaskListTableViewCell.swift
//  ToDo
//
//  Created by Neha Gupta on 09/03/21.
//

import UIKit

class TaskListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTaskName:UILabel!
    @IBOutlet weak var lblDescription:UILabel!
    @IBOutlet weak var lblDate:UILabel!
    @IBOutlet weak var lblId:UILabel!
    @IBOutlet weak var uvBackground:UIView!
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected
    }
    
    
    
}
