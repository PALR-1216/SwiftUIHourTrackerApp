//
//  SlideMenuView.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/24/22.
//

import SwiftUI

struct SlideMenuView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Image(systemName: "person")
                    .foregroundColor(.gray)
                    .imageScale(.large)
                Text("Profile")
                    .foregroundColor(.gray)
                    .font(.headline)
                
            }
            .padding(.top,100)
        }
        Spacer()
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct SlideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SlideMenuView()
    }
}
