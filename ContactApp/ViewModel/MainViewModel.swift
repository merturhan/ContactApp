//
//  MainViewModel.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import Foundation

class MainViewModel : ObservableObject{
    
    @Published var allPeople : [PersonModel] = []
    
    let db : FMDatabase?
    
    init(){
        let databasePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let destination = URL(fileURLWithPath: databasePath).appendingPathComponent("ContactAppDB.sqlite")
        db = FMDatabase(path: destination.path)
    }
    
    func loader(){
        db?.open()
        
        var list = [PersonModel]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM person", values: nil)
            
            while(result.next()) {
                let person_id = Int(result.string(forColumn: "person_id"))!
                let person_name = result.string(forColumn: "person_name")!
                let person_phone = result.string(forColumn: "person_phone")!
                
                let person = PersonModel(person_id: person_id, person_name: person_name, person_phone: person_phone)
                list.append(person)
            }
            allPeople = list
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
    func search(word : String){
        db?.open()
        var list = [PersonModel]()
        
        do{
            let result = try db!.executeQuery("SELECT * FROM person WHERE person_name like ? ", values: ["%\(word)%"])
            
            while(result.next()){
                let person_id = Int(result.string(forColumn: "person_id"))!
                let person_name = result.string(forColumn: "person_name")!
                let person_phone = result.string(forColumn: "person_phone")!
                
                let person = PersonModel(person_id: person_id, person_name: person_name, person_phone: person_phone)
                list.append(person)
            }
            allPeople = list
        }
        catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func delete(person_id : Int){
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM person WHERE person_id = ?", values: [person_id])
            loader()
        }
        catch{
            print(error.localizedDescription)
        }
        
        db?.close()
    }
    
}
