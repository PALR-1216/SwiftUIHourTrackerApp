//
//  ContentView.swift
//  workoutTimer
//
//  Created by Pedro Alejandro on 2/4/21.
//

import SwiftUI

struct ContentView: View {
    @State var show = false
    var body: some View {
        VStack {
            HStack{
                Text("Timer")
                    .font(.system(size: 55))
                    .fontWeight(.bold)
                Spacer()
                Button(action: {
                    show.toggle()
                }, label: {
                    Image(systemName: "gearshape")
                        .font(.title2)
                })
            }
            .padding(.horizontal)
            Spacer()
        }
        .sheet(isPresented: $show, content: {
            DetailView()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


