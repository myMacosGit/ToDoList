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
    
    
    var testDos: [ToDo] = []   // like @State ObservableObjects, for properties
    
    
    init() {
        // Temp data here
        ///toDos.append(ToDo(id:UUID().uuidString, item: "Learn Swift")) // add struct data to toDos array
        ///toDos.append(ToDo(id:UUID().uuidString, item: "Build Apps"))  // created struct has no id defined
        ///toDos.append(ToDo(id:UUID().uuidString, item: "Change Swift"))
        
        /// purgeData()
        loadData()
        
        nrTimesCalled += 1
        
        let _ = print("init - ToDosViewModel")
    } // init
    
    func toggleIsCompleted(toDo: ToDo) {
            // Do no try to update if toDos.id == nil, never should be
        guard toDo.id != nil else { return }
        
        if let index =  toDos.firstIndex(where: {$0.id == toDo.id} ) {

            print ("toggle1 \(index)  \(toDos[index])")
            toDos[index].isCompleted.toggle()
            print ("toggle2   \(toDos[index])")
        }
       
        // Copy toDo is constant into a newToDos (var) so we can update the isCompleted

        /*
        var newToDo = toDo
        newToDo.isCompleted.toggle()
        // Find the ID for the newToDo in the array of toDos, the update at that index
        if let index = toDos.firstIndex(where: {$0.id == newToDo.id} ) {
            toDos[index] = newToDo
        }
         */
        saveData()
        
    } // toggleIsCompleted
    
    func saveToDo (toDo: ToDo) {
        // Defined with Let and parameters can not changed
        // If new then add else update existing toDo that was passed from List

        if toDo.id == nil {
            var newToDo = toDo
            newToDo.id = UUID().uuidString  // error, is let     toDo.id = UUID().uuidString
            toDos.append(newToDo)
        } else {
            let _ = print("\n ****** old \(toDo)  \n")
            if let index =
                toDos.firstIndex(where: {$0.id == toDo.id} ) {
                toDos[index] = toDo
            }
            
            
        } // if
        saveData()

    } // saveToDo
    
    func deleteToDo (indexSet: IndexSet) {
        toDos.remove(atOffsets: indexSet)
        saveData()
    }
    
    func moveToDo (fromOffsets:IndexSet, toOffsets: Int) {
        toDos.move(fromOffsets: fromOffsets, toOffset: toOffsets)
        saveData()
    }
    
    func saveData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode(toDos)   // ignore any errors
                                                      // if error thrown, data is nil
        do {
            try data?.write(to: path)  // if data nil, then do not write
            
            // let a = Array(data!) all hex characters
        } catch {
            print ("😀ERROR: Could not save date \(error.localizedDescription)")
        }
    } // saveData

    func loadData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        guard let data = try? Data(contentsOf: path) else { return }
        do {
            toDos = try JSONDecoder().decode(Array<ToDo>.self, from: data)
        } catch {
            print ("😀ERROR: Could not read date \(error.localizedDescription)")
        }
    } // loadData

    func purgeData() {
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("")
                                                   
        do {
            try data?.write(to: path)  // if data nil, then do not write
            
            // let a = Array(data!) all hex characters
        } catch {
            print ("😀ERROR: Could not purge date \(error.localizedDescription)")
        }
    } // purgeData
    
    func saveInit() {
        toDos.removeAll()  // remove all toDos
        
        toDos.append(ToDo(id:UUID().uuidString, item: "Learn Swift")) // add struct data to toDos array
        toDos.append(ToDo(id:UUID().uuidString, item: "Build Apps"))  // created struct has no id defined
        toDos.append(ToDo(id:UUID().uuidString, item: "Change Swift"))
 
        let path = URL.documentsDirectory.appending(component: "toDos")
        let data = try? JSONEncoder().encode("toDos")   // ignore any errors
                                                      // if error thrown, data is nil
        do {
            try data?.write(to: path)  // if data nil, then do not write
            
            // let a = Array(data!) all hex characters
        } catch {
            print ("😀ERROR: Could not saveInit date \(error.localizedDescription)")
        }
    } // saveData
    
    

} // ToDosViewModel
