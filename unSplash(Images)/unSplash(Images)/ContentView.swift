//
//  ContentView.swift
//  unSplash(Images)
//
//  Created by Pedro Alejandro on 12/27/20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = GetData()
    var body: some View {
        NavigationView {
            List(data.result, id: \.self){ i in
                Text(i.alt_description)
                
            }
            .navigationTitle("Photos")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
