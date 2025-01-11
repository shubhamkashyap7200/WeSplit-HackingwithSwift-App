//
//  ContentView.swift
//  WeSplit-HackingwithSwift-App
//
//  Created by Shubham on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    @State private var tapCount = 0
    @State private var nameTextfieldText = ""
    
    var body: some View {
        Form {
            TextField("Enter your name", text: $nameTextfieldText)
            Text("You name is \(nameTextfieldText)!")
        }
        
        
        
        
        
        
        
        
        
        
        
        
//        Button("Tap Count: \(tapCount)") {
//            tapCount += 1
//        }
        
        
        
        
//        NavigationStack {
//            Form {
//                Section {
//                    Text("This new text")
//                    Text("This new text")
//                } header: {
//                    Text("First Section")
//                }
//                
//                Section {
//                    Text("This new text")
//                    Text("This new text")
//                    Text("This new text")
//                } header: {
//                    Text("Second Section")
//                }
//            }
//            .navigationTitle("Bill Split App")
//            .navigationBarTitleDisplayMode(.automatic)
//        }
    }
}

#Preview {
    ContentView()
}
