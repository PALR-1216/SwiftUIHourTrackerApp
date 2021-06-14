//
//  WebView.swift
//  NewsApp
//
//  Created by Pedro Alejandro on 1/2/21.
//

import SwiftUI
import WebKit
import Foundation


struct WebView: UIViewRepresentable {
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: url) else{return WKWebView()}
        let request = URLRequest(url: url)
        let webView = WKWebView()
        webView.load(request)
        return webView
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
