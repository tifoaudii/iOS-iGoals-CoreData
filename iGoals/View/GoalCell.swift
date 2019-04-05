//
//  GoalCell.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 05/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {
    
    //MARK: OUTLETS
    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupCell(desc: String, type: String, progress: Int) {
        self.goalDescription.text = desc
        self.goalType.text = type
        self.goalProgress.text = String(describing: progress)
    }
}
