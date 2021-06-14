//
//  ContentView.swift
//  NewsApp
//
//  Created by Pedro Alejandro on 12/31/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var data = GetData()
    @State var show = false
    var body: some View {
        NavigationView{
            ScrollView {
                VStack{
                    
                    ForEach(data.article, id: \.self){ i in
                       NavigationLink(
                        destination: WebView(url: i.url),
                        label: {
                            ListView(data: i)
                        })
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .navigationTitle("HeadLines")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HeadView: View {
    var body: some View{
        VStack{
            
            
        }
        
    }
}
