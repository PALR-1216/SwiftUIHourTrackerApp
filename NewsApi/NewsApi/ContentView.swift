//
//  ContentView.swift
//  NewsApi
//
//  Created by Pedro Alejandro on 10/8/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            
            
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=006ae0fd5fc74acd89361ba32c12ddb1





class GetData:ObservableObject {
    
}
