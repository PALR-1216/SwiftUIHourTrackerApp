//
//  ContentView.swift
//  AnimeApp
//
//  Created by Pedro Alejandro on 1/21/21.
//

import SwiftUI
import SDWebImageSwiftUI
struct ContentView: View {
    @ObservedObject var data = GetData()
    var items = [
//        GridItem(.flexible())
        GridItem(.flexible(minimum: 400, maximum: 500))
    ]
    
    @State var show = false
    var body: some View {
        NavigationView{
            ScrollView{
                LazyVGrid(columns: items) {
                    ForEach(data.Data, id: \.id){ i in
                        ListView(data: i)
                    }
                }
            }
            .navigationTitle("Top Anime's")
        }
        .onAppear {
            data.fetch()
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}




//
//
//NavigationView{
//    ScrollView{
//        ForEach(data.Data, id: \.id){ i in
//            NavigationLink(destination: DetailView(data: i)) {
//                ListView(data: i)
//            }
//
//        }
//        .navigationTitle("Top Anime's")
//    }
//}
//.onAppear(perform: {
//    data.fetch()
//
//})
