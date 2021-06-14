//: A UIKit based Playground for presenting user interface
  
import UIKit
import SwiftUI
import PlaygroundSupport

struct ProgressView: View{
    var body: some View{
        Circle()
            .stroke(lineWidth: 25)
            .foregroundColor(.blue)
        
        
    }
}


PlaygroundPage.current.setLiveView(ProgressView())
