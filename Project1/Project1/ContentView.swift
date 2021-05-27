//
//  ContentView.swift
//  Project1
//
//  Created by Maged Omar on 26/05/2021.
//

import SwiftUI

struct ContentView: View {
    //    MARK:- Properties
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let numOfPeople = Int(numberOfPeople) ?? 0
        let peopleCount = Double(numOfPeople + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0

        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    
    var totalAmount:Double{
        let orderAmount = Double(checkAmount) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let tipValue = orderAmount / 100 * tipSelection

        return tipValue + orderAmount
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section{
                    TextField("amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
//                    Picker("Number of people",selection: $numberOfPeople){
//                        ForEach(2 ..< 100){
//                            Text("\($0) people")
//                        }
//                    }
                }
                Section(header:Text("How much tip do you want to leave?")){
                    Picker("Tip percentage", selection: $tipPercentage){
                        ForEach(0 ..< tipPercentages.count ){
                            Text("\(tipPercentages[$0])$")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header:Text("Amount per person")){
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("total amount")){
                    Text("$\(totalAmount)")
                }
            }
            .navigationBarTitle("SwiftUI",displayMode: .inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
