//
//  GoalVC.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 03/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit
import CoreData

class GoalVC: UIViewController {
    
    //MARK: OUTLETS & PROPERTIES
    @IBOutlet weak var goalTableView: UITableView!
    private var goals: [Goal] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.refreshCoreDataObject()
        self.goalTableView.reloadData()
    }
    
    @IBAction func addGoalButtonPressed(_ sender: Any) {
        guard let createGoalVC = storyboard?.instantiateViewController(withIdentifier: CREATE_GOAL_VC) as? CreateGoalVC else { return }
        presentDetail(createGoalVC)
    }
    
    private func setupTableView() {
        goalTableView.delegate = self
        goalTableView.dataSource = self
        goalTableView.isHidden = false
    }
    
    private func refreshCoreDataObject() {
        self.fetchData { (success) in
            if success {
                if goals.count < 1 {
                    self.goalTableView.isHidden = true
                } else {
                    self.goalTableView.isHidden = false
                }
            }
        }
    }
    
}

//MARK: EXTENSION TABLE VIEW DELEGATE & DATA SOURCE
extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return goals.count
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GOAL_CELL, for: indexPath) as? GoalCell {
            let goal = goals[indexPath.row]
            cell.setupCell(withGoal: goal)
            return cell
        } else {
            return GoalCell()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath) in
            self.removeData(forIndexPath: indexPath, completion: { (success) in
                if success {
                    self.refreshCoreDataObject()
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            })
        }
        
        
        let updateProgressAction = UITableViewRowAction(style: .normal, title: "ADD") { (rowAction, indexPath) in
            
            self.updateProgressGoal(forIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
        
        deleteAction.backgroundColor = #colorLiteral(red: 0.9542676806, green: 0, blue: 0.1016102508, alpha: 1)
        updateProgressAction.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
        return [deleteAction, updateProgressAction]
    }
}

extension GoalVC {
    
    func removeData(forIndexPath indexPath: IndexPath, completion: (_ status: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
            completion(true)
        } catch let error as NSError {
            debugPrint(error)
            completion(false)
        }
    }
    
    func updateProgressGoal(forIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let choosenGoal = goals[indexPath.row]
        
        if choosenGoal.goalProgress < choosenGoal.goalCompletionValue {
            choosenGoal.goalProgress += 1
            
            do {
                try managedContext.save()
            } catch let error as NSError {
                debugPrint(error)
            }
        } else {
            return
        }
    }
    
    func fetchData(completion: (_ status: Bool) -> ()) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        
        do {
            goals = try managedContext.fetch(fetchRequest) as! [Goal]
            completion(true)
        } catch let error as NSError {
            debugPrint(error)
            completion(false)
        }
    }
}
