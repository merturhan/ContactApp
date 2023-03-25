//
//  PersonAddView.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import SwiftUI

struct PersonAddView: View {
    
    @State private var nameTF : String = ""
    @State private var phoneTF : String = ""
    
    var viewModel = PersonAddViewModel()
    @Environment(\.presentationMode) var pm
    
    var body: some View {
        
        VStack(spacing: 25){
            
            TextField("Person Name", text: $nameTF)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            
            TextField("Phone Number", text: $phoneTF)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("Add"){
                viewModel.add(person_name: nameTF, person_phone: phoneTF)
                pm.wrappedValue.dismiss()
            }
        }.navigationTitle("Person Add")
            
        
    }
}

struct PersonAddView_Previews: PreviewProvider {
    static var previews: some View {
        PersonAddView()
    }
}
