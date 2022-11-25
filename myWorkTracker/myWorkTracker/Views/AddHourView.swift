//
//  AddHourView.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/24/22.
//

import SwiftUI

struct AddHourView: View {
    @State var Hours: Double?
    @State var BreakTime:Double?
    var options = ["Hours", "Minutes"]
    @State var selected = "Hours"
    
    
    var body: some View {
        NavigationView {
            
            
            VStack{
                
                TextField("Enter Amount of Hours Worked", value: $Hours, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                TextField("Enter Amount of Break Time (if any)", value: $BreakTime, format: .number)
                    .textFieldStyle(.roundedBorder)
                    .padding()
                
                Picker("Select The break Type", selection: $selected){
                    ForEach(options, id: \.self) {
                        Text($0)
                    }
                }
            }
            .navigationTitle("Add Hours")
        }
    
    }
}


struct AddHourView_Previews: PreviewProvider {
    static var previews: some View {
        AddHourView()
    }
}
