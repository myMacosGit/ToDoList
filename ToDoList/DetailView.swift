//
//  DetailView.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//

import SwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) private var dismiss  // function/action
    
    @EnvironmentObject var toDosVM: ToDosViewModel  // references 3 structs in class
       
    //***************************************
    // Input Parameters for DetailView(toDo, newToDo)
    
    @State var toDo: ToDo  // struct  - receive from sheet or naviagation stack link,
                           // not private accessed from previous screen ?
    var        newToDo = false
    
    //***************************************
    
    var body: some View {
        List {
            let _ = print("DetailView ref \(Unmanaged.passUnretained(toDosVM).toOpaque())")

            // Add fields to blank toDo, then append to toDosVM
            
            TextField("Enter To Do Here", text: $toDo.item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Remainder:", isOn: $toDo.reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("Date", selection: $toDo.dueDate)
                .listRowSeparator(.hidden)
                .padding(.bottom)
                .disabled(!toDo.reminderIsOn)
            
            Text("Notes:")
            TextField("Notes", text: $toDo.notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $toDo.isCompleted)
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
                    // if new, append to toDoVM.todos else update the toDo that was passed in from the List
                    if newToDo {
                        toDosVM.toDos.append(toDo)
                        dismiss()
                    } else {
                        let _ = print("\n ****** old \(toDo)  \n")
                    }
                }
            } // item
            
        } // toolbar
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    } // view
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(toDo: ToDo())
            .environmentObject(ToDosViewModel()) // just in case, not needed
    }
}
