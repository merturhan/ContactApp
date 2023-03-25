//
//  PersonLine.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import SwiftUI

struct PersonLine: View {
    
//    var person = PersonModel(person_id: 1, person_name: "mert", person_number: "0000")
    
    var person = PersonModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15){
            Text(person.person_name!)
                .font(.custom("Avenir", size: 25))
                .bold()
            
            Text(person.person_phone!)
                .font(.custom("Avenir", size: 23))
                .foregroundColor(.secondary)
        }
    }
}

//struct PersonLine_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonLine()
//    }
//}
