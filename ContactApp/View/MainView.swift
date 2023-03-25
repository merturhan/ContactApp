//
//  HomeScreen.swift
//  ContactApp
//
//  Created by Mert Urhan on 25.03.2023.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var viewModel = MainViewModel()
    @State private var search : String = ""
    
    var body: some View {
        
        NavigationStack{
            
            List{
                ForEach(viewModel.allPeople){person in
                    NavigationLink(destination: PersonDetailsView(person : person)){
                        PersonLine(person: person)
                    }
                }.onDelete(perform: delete)
            }
            .navigationTitle("Contacts")
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: PersonAddView()){
                        Image(systemName: "plus")
                    }
                }
            }
            .onAppear{
                viewModel.loader()
            }
        }.searchable(text: $search, prompt: "Search")
            .onChange(of: search) { newValue in
                viewModel.search(word: newValue)
            }
        
    }
    
    func delete(at index : IndexSet){
        let person = viewModel.allPeople[index.first!]
        viewModel.delete(person_id: person.person_id!)
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
