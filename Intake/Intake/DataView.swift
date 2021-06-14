//
//  DataView.swift
//  Intake
//
//  Created by Pedro Alejandro on 1/31/21.
//

import SwiftUI

struct DataView: View {
    var data : Intake
    var body: some View {
        VStack{
            Text(data.typeOfFood)
        }
    }
}

