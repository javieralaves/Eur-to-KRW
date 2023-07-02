//
//  NewForm.swift
//  Won Converter
//
//  Created by Javier Alaves on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    
    // Inputs
    @State var eurInput: Double = 0.0
    @State var krwInput: Double = 0.0
    
    // The currency that the user wants to input a value in
    @State var selectedCurrency: String = "Euro"
    
    // Available currencies to choose from
    var currencies: [String] = ["Euro", "Won"]
    
    // Euro to won converter, with hardcoded value
    var eurToKrw: Double {
        return eurInput * 1437.60
    }
    
    // Won to euro converter, with hardcoded value
    var krwToEur: Double {
        return krwInput * 0.0007
    }
    
    var body: some View {
        Form {
            Section("Input") {
                // Select input currency
                Picker("Currency", selection: $selectedCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            
            // Check if input currency is euro or won
            if selectedCurrency == "Euro" {
                Section("EUR") {
                    TextField("Euro", value: $eurInput, format: .currency(code: "EUR"))
                        .keyboardType(.decimalPad)
                }
                Section("To KRW") {
                    // Specifier limits value to 2 decimals
                    Text("₩\(eurToKrw, specifier: "%.2f")")
                }
            } else {
                Section("KRW") {
                    TextField("KRW", value: $krwInput, format: .currency(code: "KRW"))
                        .keyboardType(.decimalPad)
                }
                Section("To EUR") {
                    Text("₩\(krwToEur, specifier: "%.2f")")
                }
            }
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
