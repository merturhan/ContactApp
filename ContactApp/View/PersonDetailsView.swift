//
//  PersonDetailsView.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import SwiftUI

struct PersonDetailsView: View {
    
    @State private var nameTF : String = ""
    @State private var phoneTF : String = ""
    
    var person = PersonModel()
    var viewModel = PersonDetailsViewModel()
    
    @Environment(\.presentationMode) var pm
    
    var body: some View {
        
        VStack(spacing: 25){
            
            TextField("Person Name", text: $nameTF)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            TextField("Phone Number", text: $phoneTF)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Update"){
                viewModel.update(person_id: person.person_id!, person_name: nameTF, person_phone: phoneTF)
                pm.wrappedValue.dismiss()
            }
            
        }.navigationTitle("Person Details")
            .onAppear{
                nameTF = person.person_name!
                phoneTF = person.person_phone!
            }
        
    }
}

//struct PersonDetailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonDetailsView()
//    }
//}
