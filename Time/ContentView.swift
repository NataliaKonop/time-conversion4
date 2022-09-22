//
//  ContentView.swift
//  Time
//
//  Created by Natalia Konopelkina on 21.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    
    @State private var inputNumber: Double = 0.0
    @State private var inputUnit = "seconds"
    @State private var outputUnit = "seconds"
    
    let outputUnits = ["seconds", "minutes", "hours", "days"]
    let inputUnits = ["seconds", "minutes", "hours", "days"]
    
    var equals: Double {
        let sm = inputNumber / 60
        let sh = inputNumber / 3600
        let sd = inputNumber / 86400
        let ms = inputNumber * 60
        let mh = inputNumber / 60
        let md = inputNumber / 1440
        let hs = inputNumber * 3600
        let hm = inputNumber * 60
        let hd = inputNumber / 24
        let ds = inputNumber * 86400
        let dm = inputNumber * 1440
        let dh = inputNumber * 24
        let ss = inputNumber
        let mm = inputNumber
        let hh = inputNumber
        let dd = inputNumber
        
        if inputUnit == "seconds" && outputUnit == "minutes" {
            return sm
        } else if inputUnit == "seconds" && outputUnit == "hours" {
            return sh
        } else if inputUnit == "seconds" && outputUnit == "days" {
            return sd
        } else if inputUnit == "minutes" && outputUnit == "seconds" {
            return ms
        } else if inputUnit == "minutes" && outputUnit == "hours" {
            return mh
        } else if inputUnit == "minutes" && outputUnit == "days" {
            return md
        } else if inputUnit == "hours" && outputUnit == "seconds" {
            return hs
        } else if inputUnit == "hours" && outputUnit == "minutes" {
            return hm
        } else if inputUnit == "hours" && outputUnit == "days" {
            return hd
        } else if inputUnit == "days" && outputUnit == "seconds" {
            return ds
        } else if inputUnit == "days" && outputUnit == "minutes" {
            return dm
        } else if inputUnit == "days" && outputUnit == "hours" {
            return dh
        } else if inputUnit == "seconds" && outputUnit == "seconds" {
            return ss
        } else if inputUnit == "minutes" && outputUnit == "minutes" {
            return mm
        } else if inputUnit == "hours" && outputUnit == "hours" {
            return hh
        } else if inputUnit == "days" && outputUnit == "days" {
            return dd
        }
        return 0
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker ("Your unit", selection: $inputUnit) {
                        ForEach(inputUnits, id: \.self) {
                            Text ($0)
                        }
                    }
                    Picker ("Unit you want", selection: $outputUnit) {
                        ForEach(outputUnits, id: \.self) {
                            Text ($0)
                        }
                    }
                }
                Section{
                    TextField ("Your amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                } header: {
                    Text("Your amount")
                }
                Section{
                    Text (equals, format: .number)
                } header: {
                    Text("Equals")
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

