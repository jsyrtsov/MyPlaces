//
//  NewPlaceViewController.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/9/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()

        
    }

    //MARK: Table view delegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
   
    
}
 //MARK: Text field delegate

extension NewPlaceViewController: UITextFieldDelegate {
    
    //hide kbrd when pressing Done button
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
