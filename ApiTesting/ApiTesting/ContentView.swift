//
//  ContentView.swift
//  ApiTesting
//
//  Created by Pedro Alejandro on 10/2/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @ObservedObject var data = webService()
    var body: some View {
        NavigationView{
            
            List(data.nasa, id: \.id){i in
//                ListCardView(image: i.img_src, earthDate: i.earth_date)
                VStack{
                    ZStack{
                        WebImage(url: URL(string: i.img_src))
                                            .resizable()
                                            .overlay(
                                                Rectangle()
                                                    .foregroundColor(.black)
                                                    .opacity(0.3)
                                            )
                                            
                                            .scaledToFit()
                                            .cornerRadius(8)
                                            .padding()
                                            .shadow(radius: 10)

                        Text("Earth Date - \(i.earth_date)")
                            .foregroundColor(.white)
                            .font(.title)
                            .bold()
                        
                    }
                }
                
                .onTapGesture {
                   

                }
                
            }
        
        .onAppear{
                 data.fetchData()
        }
            
        }
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


