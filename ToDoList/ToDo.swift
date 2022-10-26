//
//  ToDo.swift
//  ToDoList
//
//  Created by Richard Isaacs on 23.10.22.
//

import Foundation


//*******//
// MODEL //
//*******//
//
// MODEL <--> VIEW MODEL <--> VIEW

struct ToDo : Identifiable, Codable {
    ///let id = UUID().uuidString  // change var to let, see as string

    var id : String?

    var item  = ""
    var reminderIsOn = false
    var dueDate = Date.now + (60*60*24)
    var notes = "blank"
    var isCompleted = false
    
    func prt()
    {
        print(self)
    }
} // ToDo§
