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
            
            VStack {
                NavigationLink {
                    DetailView()
                } label: {
                    Image(systemName: "eye")
                    Text ("Show the new view")
                }.buttonStyle(.borderedProminent)
            } // VStack
           /// .padding()
            
        } // NavigationStack
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
    }
}

