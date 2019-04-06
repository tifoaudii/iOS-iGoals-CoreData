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
        
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }

    func setupCell(desc: String, type: GoalType, progress: Int) {
        self.goalDescription.text = desc
        self.goalType.text = type.rawValue
        self.goalProgress.text = String(describing: progress)
    }
}
