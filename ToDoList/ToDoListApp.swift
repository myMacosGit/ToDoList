//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Richard Isaacs on 06.10.22.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var toDosVM = ToDosViewModel()   // create class, create instance of observable object
    
    @Environment(\.scenePhase) private var scenePhase

    
    
    var body: some Scene {
        WindowGroup {
            ToDoListView()
                .environmentObject(toDosVM)   // add to environment to be used
                                              // for first and all other views
            
            ///DumpingEnvironment(optimized: true, content: Text("xxxxxx"))
            
            // EnvironmentPropertyKey<StoreKey<ToDosViewModel>> = Optional(ToDoList.ToDosViewModel)
            // ToDosViewModel : ToDoList.ToDosViewModel
            
            let _ = print("@main ref \(Unmanaged.passUnretained(toDosVM).toOpaque())")
        }
        .onChange(of: scenePhase) { phase in
             print ("phase  \(phase) ")  // inactive, active, inactive, background
             if phase == .background {
                 // Perform cleanup when all scenes within
                 // MyApp go to the background.
             }
         }
    }
} // ToDoListApp
