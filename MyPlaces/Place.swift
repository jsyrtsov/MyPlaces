//
//  PlaceModel.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/8/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import RealmSwift


class Place: Object {          //создали и описали ячейку базы данных
    
    @objc dynamic var name = ""
    @objc dynamic var location: String?
    @objc dynamic var type: String?
    @objc dynamic var imageData: Data?
    
    convenience init(name: String, location: String?, type:String?, imageData: Data?) {       //прописали инициализатор чтобы им пользоваться удобно при сохранении места
        self.init()
        self.name = name
        self.type = type
        self.location = location
        self.imageData = imageData
    }
     
}
