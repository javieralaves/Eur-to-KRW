//
//  ContentView.swift
//  Won Converter
//
//  Created by Javier Alaves on 2/7/23.
//

import SwiftUI

struct ContentView: View {
    
    @State var initialValue: Double = 0.0
    @State var inputCurrency: String = "Euro"
    
    let currencies: [String] = ["Euro", "Won"]
    
    var krwToEur: Double {
        return initialValue * 1437.60
    }
    
    var eurToKrw: Double {
        return initialValue * 0.0007
    }
    
    var isEuro: Bool {
        if inputCurrency == "Euro" {
            return true
        } else {
            return false
        }
    }
    
    var body: some View {
        Form {
            Section("Choose currency") {
                Picker("Currency", selection: $inputCurrency) {
                    ForEach(currencies, id: \.self) {
                        Text($0)
                    }
                }
                .pickerStyle(.segmented)
            }
            Section (isEuro ? "Euro" : "Won") {
                TextField("Euro", value: $initialValue, format: .currency(code: "EUR"))
                    .keyboardType(.decimalPad)
            }
            Section (isEuro ? "Won" : "Euro") {
                Text(krwToEur, format: .currency(code: "KRW"))
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
