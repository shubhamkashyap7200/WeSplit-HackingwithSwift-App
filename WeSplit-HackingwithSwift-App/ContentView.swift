//
//  ContentView.swift
//  WeSplit-HackingwithSwift-App
//
//  Created by Shubham on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    @FocusState private var amountIsFocused: Bool
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    let tipPercentagesArray = [10, 15, 20, 25, 0]
    let currencyLocationID = Locale.current.currency?.identifier ?? "USD"
    
    var grandTotalAmount: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue

        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)
        let tipValue = (checkAmount / 100) * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        
        return amountPerPerson
    }
    
    // MARK: - Views
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: currencyLocationID))
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<51) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(tipPercentagesArray, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("How much tip do you want to leave?")
                }
                
                Section("grand total after tip") {
                    Text(grandTotalAmount, format: .currency(code: currencyLocationID))
                        .foregroundStyle((tipPercentage != 0) ? Color.primary: Color.red)
                }

                
                Section("Amount per person") {
                    Text(totalPerPerson, format: .currency(code: currencyLocationID))
                }
                
            }
            .navigationTitle("Bill split app")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
