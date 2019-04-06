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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
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
    
}

//MARK: EXTENSION TABLE VIEW DELEGATE & DATA SOURCE
extension GoalVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: GOAL_CELL, for: indexPath) as? GoalCell {
            cell.setupCell(desc: "get hired as a traveloka engineer", type: .shortTerm, progress: 0)
            return cell
        } else {
            return GoalCell()
        }
    }
}
