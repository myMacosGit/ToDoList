//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//

import SwiftUI

struct ToDoListView: View {
    @State private var sheetIsPresented = false
    var toDos = ["learn swift",
                 "build apps",
                 "bring the awesome",
                 "take a vacations"]        // can not format ctrl+I, on separate line?
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos, id: \.self) { toDo in
                    NavigationLink {
                        DetailView(passedValue: toDo)
                    } label: {
                        Text(toDo)
                    }
                    .font(.largeTitle)
                }
            } // List
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                } // item
            } // toolbar
            .sheet(isPresented: $sheetIsPresented) {
                DetailView(passedValue: "")         // Apple sheet
                //.fullScreenCover(isPresented: $sheetIsPresented) {
                //    DetailView(passedValue: "") // Full screen sheet
            }
        } // NavigationStack
        
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

