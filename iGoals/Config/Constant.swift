//
//  Constant.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 03/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit


//MARK: SEGUE IDENTIFIER
let MAIN_SEGUE = "main_segue"
let CREATE_GOAL_SEGUE = "create_goal_segue"
let COMPLETE_GOAL_SEGUE = "complet_goal_segue"

//MARK: VC IDENTIFIER
let CREATE_GOAL_VC = "create_goal_vc"
let COMPLETE_GOAL_VC = "complete_goal_vc"

//MARK: CELL IDENTIFIER
let GOAL_CELL = "goal_cell"

//MARK: GOAL TYPE ENUM
enum GoalType: String {
    case longTerm = "Long Term"
    case shortTerm = "Short Term"
}

//MARK: SHARED APP DELEGATE
let appDelegate = UIApplication.shared.delegate as? AppDelegate
