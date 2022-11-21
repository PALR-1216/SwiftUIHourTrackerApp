//
//  Network.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/17/22.
//help to make user function
//https://developer.apple.com/forums/thread/666662

import Foundation
import SwiftUI



class Network:ObservableObject {
    @Published var users:[User] = []
    
    
    func getUsers(userName:String,password:String ) {
        guard let url = URL(string: "https://myworktimetracker.herokuapp.com/apiLogin") else {
            fatalError("Mising API URL")
        }
        
        
     
        let body = "userName=\(userName)&password=\(password)"
        let finalBody = body.data(using: .utf8)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request) { Data, _, err in
            if err != nil {
                print(err!)
                return
            }
            
            guard let myData = Data else{
                return
            }
          
            //i get the data form the api
            //TODO:use the data and populate my user Struct and verify if theres a user or not and send a alert that theres no user otherwise send the user to home page and save the user id to localStorage
            print(myData,String(data: myData, encoding: .utf8) ?? "*unknown encoding*")
        }.resume()
    }
}
