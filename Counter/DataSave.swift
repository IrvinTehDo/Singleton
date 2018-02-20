//
//  DataSave.swift
//  Counter
//
//  Created by Student on 2/20/18.
//  Copyright © 2018 tony. All rights reserved.
//

import Foundation

protocol DataSave{
    var dateString:String{ get set }
    var count: Int { get }
    
//    func saveDate(dateString: String)
//    func saveCount(count: Int)

    func saveDefaultsData()
    func readDefaultsData()
}

let counterKey = "counterKey"
let dateStringKey = "dateStringKey"

class DataSaveUserDefaults: DataSave{
    
    var dateString: String = "Never Set " {
        didSet{
            //Save it
            saveDefaultsData()
        }
    }
    
    var count: Int = 0 {
        didSet{
            saveDefaultsData()
        }
    }

    func saveDefaultsData() {
        // TODO:
        UserDefaults.standard.set(count, forKey: counterKey)
        UserDefaults.standard.set(dateString, forKey: dateStringKey)
    }
    
    func readDefaultsData() {
        // TODO:
        count = UserDefaults.standard.integer(forKey: counterKey)
        if let dateString = UserDefaults.standard.string(forKey: dateStringKey){
            self.dateString = dateString
        }
        else{
            self.dateString = "Last Saved: Never"
        }
    }
}

class MyAppData {
    static var shared = MyAppData(dataSave: DataSaveUserDefaults()) //Singleton Instance
    
    var counterTotal = 0
    var dateString = "Last used: never"
    var dataSave: DataSave
    
    //Dependency Injection
    //Composistion
    // Allows us to pass in data
    init(dataSave: DataSave) {
        self.dataSave = dataSave
        print("Created instance")
    }
}
