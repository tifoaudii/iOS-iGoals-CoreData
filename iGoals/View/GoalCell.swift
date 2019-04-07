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
    @IBOutlet weak var goalComplete: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        goalComplete.isHidden = true
    }

    func setupCell(withGoal goal: Goal) {
        self.goalDescription.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalProgress.text = String(describing: goal.goalProgress)
        
        if goal.goalProgress == goal.goalCompletionValue {
            goalComplete.isHidden = false
        } 
    }
    
}
