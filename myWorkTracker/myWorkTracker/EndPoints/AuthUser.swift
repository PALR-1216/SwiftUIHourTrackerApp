//
//  AuthUser.swift
//  myWorkTracker
//
//  Created by Pedro Alejandro on 11/18/22.
//

import Foundation
import SwiftUI
import Combine


struct User:Decodable {
    let Message:String?
    let Success:String
    let userId:Int
    let userName:String
    let userPassword:String
    let usersWage:Double
    let usersDeduction:Double?
    let userEmail:String
    let usersOvertime:Double
    let DateAdded:String?
}

struct Hours:Decodable,Identifiable, Hashable {
    var id = UUID()
    let hourId:Int
    let totalHour:Int
    let userId:Int
    let dateAdded:String
    let totalBreakTime:Double?
    let TotalEarned:Double
    let overtimeHours:Double?
    
    
}

//struct User:Decodable {
//    let token:String
//}

//https://reqres.in/
//https://myworktimetracker.herokuapp.com/apiLogin




class AuthUser:ObservableObject {
    //1. didChange ?
    var name = ""
    var userId = Int()
    var didChange = PassthroughSubject<AuthUser, Never>()
    @Published var hours:[Hours] = []
    
    
    @Published var isCorrect: Bool = true
    //2. run state
    @Published var isLoggedIn:Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    
    //3. function checkLogin
    func checkLogin(userName:String, password:String) {
        guard let url = URL(string: "https://myworktimetracker.herokuapp.com/apiLogin") else{
            return
        }
        
        let body: [String:String] = ["userName" : userName, "password" : password]
        guard let finalBody = try? JSONEncoder().encode(body) else{return}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: request) { data, _, err in
            guard let data = data , err == nil else {return}
            
            //4 decode Data
            let result = try? JSONDecoder().decode(User.self, from: data)
            if let result = result {
                DispatchQueue.main.async {
                    if(result.Success == "True") {
                        print("User was found")
                        self.isLoggedIn = true
                        print(result.userName)
                        self.name = result.userName
                        self.userId = result.userId
                    }
                    
                    else{
                        self.isLoggedIn = false
                        self.isCorrect = false
                        print("User was not found")
                    }
                }
            }
            
        }.resume()
    }
    
    func GetTotalHours() {
        guard let url = URL(string: "https://myworktimetracker.herokuapp.com/api/getUserHours") else{return}
        let body = ["userId":self.userId]
        guard let finalBody = try? JSONEncoder().encode(body) else{return}
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = finalBody
        
        
        URLSession.shared.dataTask(with: url) { Data, _, err in
            guard let Data = Data, err == nil else{return}
            
            
            let result = try? JSONDecoder().decode([Hours].self, from: Data)
            
            DispatchQueue.main.async {
             
                self.hours = result ?? []
                
            }
            
        }.resume()
    }
}
