//
//  MainScreenTableViewController.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/7/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import UIKit

class MainScreenTableViewController: UITableViewController {
    
    let restaurantNames = ["Burger King",
                           "McDonalds",
                           "KFC",
                           "Кавказская пленница",
                           "Сербский гриль",
                           "Столовая номер 1",
                           "БИГ шаурма",
                           "Дарк сайд",
                           "Та самая на средном",
                           "Буфетъ Обед"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = restaurantNames[indexPath.row]
        let image = UIImage(named: restaurantNames[indexPath.row])
        cell.imageView?.image = image
        

        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
