//
//  UIButtonSelected.swift
//  iGoals
//
//  Created by Tifo Audi Alif Putra on 06/04/19.
//  Copyright © 2019 BCC FILKOM. All rights reserved.
//

import UIKit

extension UIButton {
    func selectedButton() {
        self.backgroundColor = #colorLiteral(red: 0, green: 1, blue: 0.4429443479, alpha: 1)
    }
    
    func deselectedButton() {
        self.backgroundColor = #colorLiteral(red: 0.7201587558, green: 1, blue: 0.8274415135, alpha: 1)
    }
}
