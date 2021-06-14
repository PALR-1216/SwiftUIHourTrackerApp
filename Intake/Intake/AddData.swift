//
//  AddData.swift
//  Intake
//
//  Created by Pedro Alejandro on 1/31/21.
//

import SwiftUI

struct AddData: View {
    //    var data : Intake
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var data: Data
    @State var comida = ""
    @State var calories = ""
    @State private var showingAlert = false
    @State var carbs = ""
    var body: some View {
        NavigationView {
            Form{
                TextField("Name of the Food", text: $comida)
                    .disableAutocorrection(true)
                
                TextField("Enter the Carbs", text: $carbs)
                    .keyboardType(.decimalPad)
                
                TextField("Enter the Calories", text: $calories)
                    .keyboardType(.decimalPad)
            }
            .navigationBarTitle("Add Data")
            .navigationBarItems(trailing: Button(action: {
                let actualCalories = Int(self.calories)
                let actualCarbs = Int(self.carbs)
                let total = actualCarbs
                if (actualCarbs == 0) || (actualCalories == 0) || comida  == ""{
                    self.showingAlert.toggle()
                }
                
                else {
                    let items = Intake(typeOfFood: comida, carbs: actualCarbs ?? 0, calories: actualCalories ?? 0, totalCarbs: total ?? 0)
                    self.data.items.append(items)
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
            }, label: {
                Text("Save")
            }))
            .alert(isPresented: $showingAlert, content: {
                Alert(title: Text("Please fill all the data"), message: Text("You need to fill all the data to proceed"), dismissButton: .default(Text("OK")))
            })
        }
    }
}

