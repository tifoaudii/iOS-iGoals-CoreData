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
            cell.setupCell(desc: goal.goalDescription!, type: GoalType(rawValue: goal.goalType!)!, progress: Int(goal.goalProgress))
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
            self.removeData(forIndexPath: indexPath)
            self.refreshCoreDataObject()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        return [deleteAction]
    }
}

extension GoalVC {
    
    func removeData(forIndexPath indexPath: IndexPath) {
        guard let managedContext = appDelegate?.persistentContainer.viewContext else { return }
        managedContext.delete(goals[indexPath.row])
        
        do {
            try managedContext.save()
        } catch let error as NSError {
            debugPrint(error)
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
