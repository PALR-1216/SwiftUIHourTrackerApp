//
//  DetailView.swift
//  AnimeApp
//
//  Created by Pedro Alejandro on 1/21/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    @State var show = false
    var data: TopResults
    var body: some View {
        WebImage(url: URL(string: data.image_url))
            .resizable()
            .scaledToFit()
        Button(action: {
            show.toggle()
        }, label: {
            Text(data.title)
        })
        .sheet(isPresented: $show) {
            WebView(url: data.url)
        }
    }
}
