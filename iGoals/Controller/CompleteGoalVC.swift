//
//  CompleteGoalVC.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 06/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

class CompleteGoalVC: UIViewController {

    @IBOutlet weak var goalProgress: UITextField!
    private var goalDescription: String?
    private var goalType: GoalType?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func loadData(description: String, type: GoalType) {
        self.goalDescription = description
        self.goalType = type
    }
    @IBAction func backButtonPressed(_ sender: Any) {
        dismissDetail()
    }
    
    @IBAction func createGoalButtonPressed(_ sender: Any) {
        if goalProgress.text != "" {
            self.onSaveNewGoal { (success) in
                if success {
                    self.dismiss(animated: true, completion: nil)
                }
            }
        }
    }
    
    func onSaveNewGoal(completion: @escaping (_ status: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let newGoal = Goal(context: managedContext)
        
        newGoal.goalDescription = self.goalDescription
        newGoal.goalType = goalType?.rawValue
        newGoal.goalCompletionValue = Int32(goalProgress.text!)!
        newGoal.goalProgress = Int32(0)
        
        print(newGoal)
        do {
            try managedContext.save()
            completion(true)
        } catch let error as NSError {
            debugPrint(error)
            completion(false)
        }
    }
}
