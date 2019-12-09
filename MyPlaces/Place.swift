//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/8/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import UIKit


struct Place {
    
    var name: String
    var location: String?
    var type: String?
    var image: UIImage?
    var testImage: String?
     
    static let restaurantNames = ["Burger King",
                           "McDonalds",
                           "KFC",
                           "Кавказская пленница",
                           "Сербский гриль",
                           "Столовая номер 1",
                           "БИГ шаурма",
                           "Дарк сайд",
                           "Та самая на средном",
                           "Буфетъ Обед"]
 
    static func getPlaces() -> [Place] {
        
        var placesArray = [Place]()
        
        for i in restaurantNames {
            placesArray.append(Place(name: i, location: "Нижний Новгород", type: "Фаст-фуд", image: nil, testImage: i))
        }
        
        return placesArray
        
    }
}
