//
//  LottieView.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/16/22.
//

import SwiftUI
import Lottie


struct LottieView:UIViewRepresentable {
  
    
    let lottieFile:String
    
    let animationView = LottieAnimationView()
    
    func makeUIView(context: Context) -> some UIView {
        let view =  UIView(frame: .zero)
        
        animationView.animation = Animation.named(lottieFile)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = .loop
        animationView.play()
        
        view.addSubview(animationView)
        animationView.translatesAutoresizingMaskIntoConstraints = false
        animationView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        animationView.heightAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        return view
        
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
