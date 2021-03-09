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
    
    var task:Task!
    var id:Int!
    let formatter = DateFormatter()
    let kDateFormat = "dd/MM/yyyy"
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
        formatter.dateFormat = kDateFormat
        //lblId.isHidden = true
        lblId.text = "\(task.id)"
        lblTaskName.text = task.taskName
        lblDescription.text = task.taskdescription
        lblDate.text = formatter.string(from: task.date ?? Date())
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected
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
