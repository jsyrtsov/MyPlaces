//
//  MainScreenTableViewController.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/7/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import UIKit

class PlacesViewController: UITableViewController {
    
    var places = Place.getPlaces()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let place = places[indexPath.row]

        cell.nameLabel.text = place.name
        cell.locationLabel.text = place.location
        cell.typeLabel.text = place.type
        
        if place.image == nil {
            cell.imageOfPlace.image = UIImage(named: place.testImage!)
        } else {
            cell.imageOfPlace.image = place.image
        }
      
        
        cell.imageOfPlace.layer.cornerRadius = cell.imageOfPlace.frame.size.height / 2
        cell.imageOfPlace.clipsToBounds = true

        return cell
    }
    
    // MARK: - Table view delegate
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func unwindSegue(_ segue: UIStoryboardSegue) {           //по нажатию на кнопку Сохранить сваливаемся на мейнскрин при помощи анвинд сегвея
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {
            return
        }
        newPlaceVC.saveNewPlace()                                       //вызываем метод сохраняющий параметры НьюПлейса в структуру
        places.append(newPlaceVC.newPlace!)                             //добавляем в массив новое место
        tableView.reloadData()                                          //обновляем таблицу
        
    }
}
