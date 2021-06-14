//
//  ListView.swift
//  AnimeApp
//
//  Created by Pedro Alejandro on 1/21/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    var data: TopResults
    var body: some View {
        LazyVStack{
            ZStack{
                WebImage(url: URL(string: data.image_url))
                    .resizable()
                    .frame(width: 400, height: 600)
                    .overlay(
                        Rectangle()
                            .foregroundColor(.black)
                            .opacity(0.3)
                    )

                    
                    .scaledToFit()
                    .cornerRadius(8)
                    .padding()
                    .shadow(radius: 10)
                
                Text(data.title)
                    .font(.title2)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding()
            }
        }
    }
}




//
