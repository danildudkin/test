//
//  TableViewCell.swift
//  Lesson_14B
//
//  Created by Danila Dudkin on 29.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var dealsLabel: UILabel!
    
    @IBOutlet weak var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
