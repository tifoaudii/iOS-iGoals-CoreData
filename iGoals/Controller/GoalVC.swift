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
        
        
    }
    @IBAction func addGoalButtonPressed(_ sender: Any) {
    }
    
}

//MARK: EXTENSION TABLE VIEW DELEGATE & DATA SOURCE
//extension GoalVC: UITableViewDelegate, UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//}
