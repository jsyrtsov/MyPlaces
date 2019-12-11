//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/8/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import RealmSwift


class Place: Object {
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
     
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
 
    func savePlaces() {
        
        for i in restaurantNames {
            
            let image = UIImage(named: i)
            guard let imageData = image?.pngData() else { return }        //переводим картинку из УИимейдж в тип Дата потому что Рилм не поддерживает УИКит
            
            let newPlace = Place()
            
            newPlace.name = i
            newPlace.location = "Нижний Новгород"
            newPlace.type = "Фаст-Фуд"
            newPlace.imageData = imageData
            
            StorageManager.saveObject(newPlace)            //вызываем метод, он сохраняет все заведения в базу
        }
        
        return
        
    }
}
