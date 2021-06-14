//
//  DetailView.swift
//  NewsApp
//
//  Created by Pedro Alejandro on 1/2/21.
//

import SwiftUI

struct DetailView: View {
    var data: Articles
    var body: some View {
        Text(data.title)
    }
}
