//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//

import SwiftUI

struct ToDoListView: View {
    var body: some View {
        NavigationStack {
            List {
                Section {
                    NavigationLink {
                        DetailView()
                    } label: {
                        Text("Winter")
                    }
                    Text("Summer")

                } header: {                // unusual
                    Text("Breaks")
                }
                Section {
                    
                    Text("Sprint")
                    Text("Fall")
                } header: {
                    Text("Semesters")
                }
            } // List
            .navigationTitle("School Year")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.grouped)
            
            
            // not after Nav Stack
        } // NavigationStack
        
        
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

