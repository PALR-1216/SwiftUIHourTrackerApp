

//
//  ContentView.swift
//  EnvirontmentView
//
//  Created by Ipung Dev Center on 06/07/20.
//  Copyright © 2020 Banyu Center. All rights reserved.
//
import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var userAuth: AuthUser
//    let data = UserDefaults.standard
    
    
    
    var body: some View {
        //save the data to always be logged in
//        if(self.data.integer(forKey: "token") == 1) {
//            return AnyView(Login())
//
//        }
        if !self.userAuth.isLoggedIn {
            return AnyView(Login())
        } else {
            return AnyView(Home(user: userAuth.name))
            
        }
    }
}

struct Login : View {
    @EnvironmentObject var userAuth: AuthUser
    
    @State private var showModal = false
    @State var username: String = ""
    @State var password: String = ""
    
    let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
    
    //7 buat validasi jika field tidak diisi
    @State var isEmptyField = false
    
    var body: some View {
        //Background View
        ZStack{
            Color.white
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                //1. Purple Welcome
                HStack{
                    HStack{
                        VStack(alignment:.leading){
                            Text("Hi!").bold().font(.largeTitle).foregroundColor(.white)
                            Text("Welcome Back").font(.title).foregroundColor(.white)
                        }
                        Spacer()
                    
                    }
                    Spacer()
                }
                .frame(height: 180)
                .padding(30)
                .background(Color.purple)
                .clipShape(CustomShape(corner: .bottomRight, radii: 50))
                .edgesIgnoringSafeArea(.top)
                
//
//                if !self.userAuth.isLoggedIn {
//                    HStack{
//                        HStack{
//                            Spacer()
//                            Image(systemName: "exclamationmark.icloud").foregroundColor(Color.white)
//                            Text("Please LogIn").font(.body).foregroundColor(Color.white)
//                            Spacer()
//                        }
//                    .padding()
//                        .background(Color.red)
//                    .cornerRadius(20)
//                    }.padding()
//                }

                //Form Field
                VStack(alignment:.leading){
                    //Username
                    Text("Username")
                    TextField("Username...", text: $username)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    //Password
                    Text("Password")
                    SecureField("Password...", text: $password)
                        .padding()
                        .background(lightGreyColor)
                        .cornerRadius(5.0)
                        .autocapitalization(.none)
                    
                    
                    //8 Peringatan jika salah login
                    if(!self.userAuth.isCorrect){
                        Text("Password or userName is incorrect").foregroundColor(.red)
                    }
                    
                    //9 peringatan jika field kosong
                    if(self.isEmptyField){
                        Text("Please fill all credentials!").foregroundColor(.red)
                    }
                    
                    
                    //Forgot Password
                    HStack{
                        
                        Button(action:{}){
                            Text("Forgot Password?")
                        }
                        Spacer()
                    }.padding([.top,.bottom], 10)
                    
                    //Sign In Button
                    HStack{
                        Spacer()
                        Button(action: {
                            
                         
                            //10 Event cek login
                            if(self.username.isEmpty || self.password.isEmpty){
                                self.isEmptyField = true
                            }else {
                                self.userAuth.checkLogin(userName: self.username, password: self.password)
                            }
                        }){
                           
                            Text("Sign In").bold().font(.callout).foregroundColor(.white)
                        }
                        Spacer()
                    }
                    .padding()
                    .background(Color.purple)
                    .cornerRadius(15)
                    
                  
                    //Register Button
                    HStack{
                        Text("Don't have an account?").bold().font(.callout).foregroundColor(.black)
                        Spacer()
                        Button(action: {}){
                            Text("Sign Up?").bold().font(.callout).foregroundColor(.purple)
                        }
                    }
                    .padding()
                }.padding(30)
                
                Spacer()
            }
            
            
        }
    }
}

//Home View
struct Home : View {
    @EnvironmentObject var userAuth: AuthUser
    @State var user: String
    
    
    var body : some View {
        NavigationView{
            ZStack{
                Color.purple
                
                Text("welcomeUser = \(user)")
                    
                    .navigationBarTitle("Home", displayMode: .inline)
                    .navigationBarItems(trailing:
                        
                        Button(action: {
                            self.userAuth.isLoggedIn = false
                            self.userAuth.isCorrect = true
                            
                        }){
                            Image(systemName: "arrowshape.turn.up.right.circle")
                        }
                )
                
            }
        }.ignoresSafeArea()
    }
}

//Custom Shape
struct CustomShape : Shape {
    var corner : UIRectCorner
    var radii : CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radii, height: radii))
        
        return Path(path.cgPath)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

