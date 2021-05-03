//
//  CalendraTaskTableViewCell.swift
//  ToDo
//
//  Created by Neha Gupta on 03/05/21.
//

import UIKit

class CalendraTaskTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTaskName:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
