//
//  TableViewCell.swift
//  RefinementTableView
//
//  Created by home on 2020/03/06.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var RefinementConditionTitle: UILabel!
    @IBOutlet weak var RefinementCondition: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
