//
//  PersonAddViewModel.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import Foundation

class PersonAddViewModel{
    
    let db : FMDatabase?
    
    init(){
        let databasePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destination = URL(fileURLWithPath: databasePath).appendingPathComponent("ContactAppDB.sqlite")
        db = FMDatabase(path: destination.path)
    }
    
    func add(person_name : String, person_phone : String){
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO Person (person_name,person_phone) VALUES (?,?)", values: [person_name, person_phone])
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
}
