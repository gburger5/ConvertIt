//
//  ContentView.swift
//  ConvertIt
//
//  Created by Gabriel Burger on 1/21/24.
//

import SwiftUI

struct ContentView: View {
    // State Variables
    @State private var inputNumber = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @FocusState private var focused: Bool
    
    // Array of Unit Choices for the User
    
    let inputChoices = ["M", "Km", "Ft", "Yd", "Mi"]
    
    var unitConversion: Double{
        // Helper Variables
        var converted = 0.0
        var finalConversion = 0.0
        
        
        // Changes all Input Values to Meters
        if(inputUnit == "M") {
            converted = inputNumber
        }
        if(inputUnit == "Km") {
            converted = inputNumber * 1000
        }
        if(inputUnit == "Ft") {
            converted = inputNumber / 3.281
        }
        if(inputUnit == "Yd") {
            converted = inputNumber / 1.094
        }
        if(inputUnit == "Mi"){
            converted = inputNumber * 1609
        }
        
        
        // Changes from the Meter Converted Value to the Output Unit
        if (outputUnit == "M") {
            finalConversion = converted
        }
        if(outputUnit == "Km") {
             finalConversion = converted / 1000
        }
        if(outputUnit == "Ft") {
            finalConversion = converted * 3.281
        }
        if(outputUnit == "Yd") {
            finalConversion = converted * 1.094
        }
        if(outputUnit == "Mi") {
            finalConversion = converted / 1609
        }
        
        
        
        return finalConversion
    }
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Please Type Your Value.") {
                    TextField("Numeric Value", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($focused)
                    
                }
                
                
                Section("Please Select a Unit") {
                    Picker("Unit Choice", selection: $inputUnit) {
                        ForEach(inputChoices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                }
                
                Section("Please Select an Output Unit") {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(inputChoices, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Final Conversion") {
                    Text("Final Conversion = \(unitConversion)")
                }
                
            }
            .navigationTitle("Convert-It: Length")
            .toolbar {
                if focused {
                    Button("Done") {
                        focused = false
                    }
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
