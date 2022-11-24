//
//  AddHourView.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/24/22.
//

import SwiftUI

struct AddHourView: View {
    @State var Hours: Double = 0
    var body: some View {
        VStack{
            Text("Add Hour")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            TextField("Enter Amount of Hours Worked", value: $Hours, format: .number)
                .textFieldStyle(.roundedBorder)
                .padding()
            
            
        }
    }
}


struct AddHourView_Previews: PreviewProvider {
    static var previews: some View {
        AddHourView()
    }
}
