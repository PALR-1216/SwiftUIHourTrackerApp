//
//  LoginView.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/19/22.
//

import Foundation
import SwiftUI

struct LoginView:View {
    
    @EnvironmentObject var authUser:AuthUser
    @State private var username = ""
    @State private var password = ""
    @State private var EmptyValue = false
    var body: some View{
        
        
        ZStack {
            Color.blue
                .ignoresSafeArea()
            Circle()
                .scale(1.7)
                .foregroundColor(.white.opacity(0.15))
            Circle()
                .scale(1.35)
                .foregroundColor(.white)
            
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                TextField("Email", text: $username)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                //                        .border(.red, width: CGFloat(wrongUsername))
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .frame(width: 300, height: 50)
                    .background(Color.black.opacity(0.05))
                    .cornerRadius(10)
                //                        .border(.red, width: CGFloat(wrongPassword))
                
                
              
                Button("Login") {
                    //auth user here
                    Network().getUsers(userName: username, password: password)
                    //                        showingLoginScreen = true
                    if(self.username.isEmpty || self.password.isEmpty) {
                        EmptyValue = true
                    }
                    
                    else{
                        self.authUser.checkLogin(userName: self.username, password: self.password)
                    }
                    
                    if(!self.authUser.isCorrect) {
                        Text("UserName or password Incorrect").foregroundColor(.red)
                    }
                    
                    if(self.EmptyValue) {
                        Text("Please enter Values").foregroundColor(.red)
                        
                    }
                }
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                
            }
        }
    }
    }

    
