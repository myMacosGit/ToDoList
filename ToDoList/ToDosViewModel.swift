//
//  ToDoViewModel.swift
//  ToDoList
//
//  Created by Richard Isaacs on 23.10.22.
//

import Foundation

//************//
// VIEW MODEL //
//************//
//
// MODEL <--> VIEW MODEL <--> VIEW
//
// struct      class          view

class ToDosViewModel : ObservableObject {  // for class
    
    //struct ToDo
    //  let id = UUID().uuidString  // change var to let, see as string
    //
    //  var item         = ""
    //  var reminderIsOn = false
    //  var dueDate      = Date.now + (60*60*24)
    //  var notes        = "blank"
    //  var isCompleted  = false
    
    @Published var toDos: [ToDo] = []   // like @State ObservableObjects, for properties
    @Published var nrTimesCalled = 0   // like @State ObservableObjects, for properties
    
    init() {
        // Temp data here
        toDos.append(ToDo(item: "Learn Swift")) // add struct data to toDos array
        toDos.append(ToDo(item: "Build Apps"))
        toDos.append(ToDo(item: "Change Swift"))
        
        nrTimesCalled += 1
        
        let _ = print("init - ToDosViewModel")
    } // init
    
    func saveToDo (toDo: ToDo, newToDo: Bool) {
        if newToDo {
            toDos.append(toDo)
        } else {
            let _ = print("\n ****** old \(toDo)  \n")
            if let index =
                toDos.firstIndex(where: {$0.id == toDo.id} ) {
                toDos[index] = toDo
            }
        } // if
               
    } // saveToDo
    
    func delete (indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
    }
    
    func move (fromOffsets:IndexSet, toOffsets: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffsets)
        
    }

    
} // ToDosViewModel

