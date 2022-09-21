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
        let sh = inputNumber/3600
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
        
        return sm; sh; sd; ms; mh; md; hs; hm; hd; ds; dm; dh
    }
}
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker ("Your unit", selection: $inputUnit) {
                        ForEach(inputUnit, id: \.self) {
                            Text ($0, format: String)
                        }
                    }
                    Picker ("Unit you want", selection: $outputUnit) {
                        ForEach (outputUnit, id: \.self)
                            Text ($0, format: String)
                        }
                    }
                Section{
                    TextField ("Your amount", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                }
                Section{
                    Text (equals, format: .number)
                }
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
