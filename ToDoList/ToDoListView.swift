//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//


//******//
// VIEW //
//******//
//
// MODEL <--> VIEW MODEL <--> VIEW
//
// struct      class          view

import SwiftUI

struct DumpingEnvironmentx<V: View>: View {
    
    @Environment(\.self) var env
    let content: V
    var body: some View {
        dump(env)
        return content
    }
}

// [EnvironmentPropertyKey<StoreKey<ToDosViewModel>> = Optional(ToDoList.ToDosViewModel),

struct ToDoListView: View {
    
    @State private var sheetIsPresented = false
    @EnvironmentObject var toDosVM: ToDosViewModel
    
    var body: some View {
        
        let _ = print("ToDoListView ref \(Unmanaged.passUnretained(toDosVM).toOpaque())")
        
        NavigationStack {
            List {
                ForEach(toDosVM.toDos) { toDo in     // published property
                    
                    HStack {
                        
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDosVM.toggleIsCompleted(toDo: toDo)
                            }
                        
                        NavigationLink {
                            // Pass in existing ToDo struct to view
                            DetailView(toDo: toDo)
                        } /* NavigationLink */
                    label: {
                        Text(toDo.item)
                    } // label
                        
                    } // HStack
                    .font(.largeTitle)
                    
                }  // ForEach
                
                
                // Shorthand calls to onDelete and onMove
                
                .onDelete(perform: toDosVM.deleteToDo)   // in the wild
                .onMove(perform: toDosVM.moveToDo)
                
                
                // Traditional calls
                //                .onDelete { indexSet in
                //                    /// toDosVM.toDos.remove(atOffsets: indexSet)
                //                    toDosVM.delete(indexSet: indexSet)
                //                }
                //                .onMove { fromOffsets, toOffsets in
                //                    ///toDosVM.toDos.move(fromOffsets: fromOffsets, toOffset: toOffsets)
                //                    toDosVM.move(fromOffsets: fromOffsets, toOffsets: toOffsets)
                //                }
                //
                
            } // List
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.grouped)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                } // item
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } /* Button */
                label: {
                    Image(systemName: "plus")
                } // label
                } // item
            } // toolbar
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    // Create a blank toDo struct and pass to DetailView
                    // to be filled in by view
                    DetailView(toDo: ToDo(notes:"To be filled in"))
                    
                }
                //.fullScreenCover(isPresented: $sheetIsPresented) {
                //    DetailView(passedValue: "") // Full screen sheet
            } // .sheet
            
            // TODO: DumpingEnvironment(optimized: true, content: Text(""))
            
        } // NavigationStack
    } // body
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListView()
            .environmentObject(ToDosViewModel())  // needs an object
    }
}

