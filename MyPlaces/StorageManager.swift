//
//  StorageManager.swift
//  MyPlaces
//
//  Created by Evgeny Syrtsov on 12/11/19.
//  Copyright © 2019 Evgeny Syrtsov. All rights reserved.
//

import RealmSwift

let realm = try! Realm()

class StorageManager {
    
    static func saveObject(_ place: Place) {    //метод для сохранения объектов с типом плейс
        
        try! realm.write {               //метод записи в базу данных
            realm.add(place)                //добавляем в базу наш объект
        }
    }
    
    static func deleteObject(_ place: Place) {          //метод для удаления объекта из БД
        
        try! realm.write {
            realm.delete(place)
        }
    }
}
