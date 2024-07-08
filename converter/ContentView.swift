//
//  ContentView.swift
//  converter
//
//  Created by Aitzaz Munir on 23/06/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = "Celcius"
    @State private var outputUnit = "Farenheit"
    @FocusState private var numberIsFocused: Bool
    let inputUnits = ["Celcius", "Farenheit", "Kelvin"]
    let outputUnits = ["Celcius", "Farenheit", "Kelvin"]
    
    var outputNumber: Double {
        var farenNumber : Double = 0.0
        var output: Double = 0.0
        if inputUnit == "Celcius" {
            farenNumber = (inputNumber*9/5)+32
        }
        else if inputUnit == "Farenheit" {
            farenNumber = inputNumber
        }
        else if inputUnit == "Kelvin" {
            farenNumber = (inputNumber-273.15)*9/5 + 32
        }
        if outputUnit == "Celcius" {
            output = (farenNumber-32)*5/9
        }
        else if outputUnit == "Farenheit" {
            output = farenNumber
        }
        
        else if outputUnit == "Kelvin" {
            output = (farenNumber-32)*5/9 + 273.15
        }
        return output
        
    }
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section("Input Temperature Level"){
                    TextField("Enter A Number", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($numberIsFocused)
                    
                    Picker("Temperature Unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Output Temperature"){
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                    Text("\(outputNumber.formatted()) \(outputUnit)")
                }
                .navigationTitle("Temperature Converter")
                .toolbar {
                    if numberIsFocused {
                        Button("Done") {
                            numberIsFocused = false
                        }
                    }
                }
                
            }
        }
        
    }
}


#Preview {
    ContentView()
}
