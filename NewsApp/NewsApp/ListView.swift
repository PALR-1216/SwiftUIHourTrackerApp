//
//  ListView.swift
//  NewsApp
//
//  Created by Pedro Alejandro on 1/2/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    var data: Articles
    var body: some View {
        ZStack{
            WebImage(url: URL(string: data.urlToImage))
                .resizable()
                .scaledToFit()
                .overlay(Rectangle().background(Color.black).opacity(0.3))
            VStack{
                Text(data.title)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .lineLimit(2)
                    .padding()
            }
        }
        .shadow(radius: 5)
        .padding()
    }
}
