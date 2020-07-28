//
//  ContentView.swift
//  Converter
//
//  Created by Shane on 28/07/2020.
//  Copyright © 2020 Shane. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputVolume = ""
    @State private var inputUnit = 0
    @State private var outputUnit = 1
    
    let units: [UnitVolume] = [.milliliters, .liters, .cups, .imperialPints, .imperialGallons]
    
    var outputVolume: Double {
        let inputVol = Double(inputVolume) ?? 0
        let inputMeasurement = Measurement(value: inputVol, unit: units[inputUnit])
        let outputMeasurement = inputMeasurement.converted(to: units[outputUnit])

        return outputMeasurement.value
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Input volume", text: $inputVolume)
                }
                
                Section(header: Text("Input unit")) {
                    Picker("Input unit", selection: $inputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Output unit")) {
                    Picker("Output unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count) {
                            Text("\(self.units[$0].symbol)")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Output volume")) {
                    Text("\(outputVolume, specifier: "%.2f") \(units[outputUnit].symbol)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
