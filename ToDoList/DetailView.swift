//
//  DetailView.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.dismiss) private var dismiss  // function
    
    var passedValue: String
    @State private var toDo = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24)
    @State private var notes = ""
    @State private var isCompleted = false
    
    var body: some View {
        NavigationStack {
            List {
                TextField("Enter To Do Here", text: $toDo)
                    .font(.title)
                    .textFieldStyle(.roundedBorder)
                    .padding(.vertical)
                    .listRowSeparator(.hidden)
                
                Toggle("Set Remainder:", isOn: $reminderIsOn)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
                DatePicker("Date", selection: $dueDate)
                    .listRowSeparator(.hidden)
                    .padding(.bottom)
                    .disabled(!reminderIsOn)
                
                Text("Notes:")
                TextField("Notes", text: $notes, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                    .listRowSeparator(.hidden)
                
                Toggle("Completed", isOn: $isCompleted)
                    .padding(.top)
                    .listRowSeparator(.hidden)
                
            } // List
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                } // item
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: add save
                    }
                } // item
                
            } // toolbar
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
            
        } // NavigationStack
    } // view
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item -1")
    }
}
