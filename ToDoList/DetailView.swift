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
    
    var body: some View {
        VStack {
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
            
            Text("DV:You are a swifty legend\nAnd you passed over a value \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            
            Spacer()
            Button("Get Back") {
                dismiss()
            }
            
        } // VStack
        .padding()
        ///.navigationBarBackButtonHidden()
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(passedValue: "Item -1")
    }
}
