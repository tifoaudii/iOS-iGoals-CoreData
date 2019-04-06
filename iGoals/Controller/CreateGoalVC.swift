//
//  CreateGoalVC.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 06/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class CreateGoalVC: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var shortTermButton: UIButton!
    @IBOutlet weak var longTermButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    private var choosenGoalType: GoalType = .shortTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goalTextView.delegate = self
        nextButton.bindToKeyboard()
    }
    
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        self.choosenGoalType = .shortTerm
        shortTermButton.selectedButton()
        longTermButton.deselectedButton()
    }
    
    @IBAction func nextButtonPressed(_ sender: Any) {
        if goalTextView.text != "" && goalTextView.text != "What is your goal?" {
            nextButton.isEnabled = true
            guard let CompleteGoalVC = storyboard?.instantiateViewController(withIdentifier: COMPLETE_GOAL_VC) as? CompleteGoalVC else { return }
            CompleteGoalVC.loadData(description: goalTextView.text, type: choosenGoalType)
            presentDetail(CompleteGoalVC)
        }
    }
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        self.choosenGoalType = .longTerm
        longTermButton.selectedButton()
        shortTermButton.deselectedButton()
    }
    
}

extension CreateGoalVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        self.goalTextView.text = ""
        self.goalTextView.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
}
