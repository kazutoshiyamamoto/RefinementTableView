//
//  RunCell.swift
//  RefinementTableView
//
//  Created by home on 2020/03/26.
//  Copyright © 2020 Swift-beginners. All rights reserved.
//

import UIKit

protocol SearchButtonDelegate {
    func tappedSearchButton()
}

protocol ClearButtonDelegate {
    func tappedClearButton()
}

class RunCell: UITableViewCell {

    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
