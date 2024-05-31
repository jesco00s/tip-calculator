//
//  ContentView.swift
//  TipCalculator
//
//  Created by Jose.Escobar on 5/31/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var beforeTipPrice = ""
    @State var tipRate = ""
    @State var afterTipPrice = ""
    
    var body: some View {
        VStack {
            Text("Tip Calculator")
                .font(.largeTitle)
                .foregroundColor(Color.blue)
            
            HStack {
                Text("Before Tip Price")
                TextField("$0", text: $beforeTipPrice)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                
            }.padding(.top, 40.0)
            
            HStack {
                Text("Sales Tip Rate")
                TextField("0%", text: $tipRate)
                    .keyboardType(/*@START_MENU_TOKEN@*/.decimalPad/*@END_MENU_TOKEN@*/)
                
            }.padding(.top, 20.0)
            
            HStack {
                Text("After Tip Price")
                TextField("", text: $afterTipPrice)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                
            }.padding(.top, 20.0)
            
            HStack{
                Button("Reset") {
                    beforeTipPrice = ""
                    tipRate = ""
                    afterTipPrice = ""
                }
                .padding(.trailing)
                
                Button("Calculate") {
                    if let beforeTax = Float(beforeTipPrice),
                       let taxRate = Float(tipRate) {
                        let salesTax = beforeTax * taxRate / 100
                        afterTipPrice = String( beforeTax + salesTax)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
