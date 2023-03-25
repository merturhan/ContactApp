//
//  PersonDetailsViewModel.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import Foundation

class PersonDetailsViewModel{
    
    let db : FMDatabase?
    
    init(){
        let databasePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destination = URL(fileURLWithPath: databasePath).appendingPathComponent("ContactAppDB.sqlite")
        db = FMDatabase(path: destination.path)
    }
    
    func update(person_id : Int, person_name : String, person_phone : String){
        db?.open()
        
        do{
            try db!.executeUpdate("UPDATE person SET person_name = ? , person_phone = ? WHERE person_id = ?", values: [person_name, person_phone, person_id])
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}
