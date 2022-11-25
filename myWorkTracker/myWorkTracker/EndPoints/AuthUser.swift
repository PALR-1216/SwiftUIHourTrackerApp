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
    let TotalHours:String
    let TotalEarned:Double
    let userId:Int
    let userName:String
    let userPassword:String
    let usersWage:Double
    let usersDeduction:Double?
    let userEmail:String
    let usersOvertime:Double
    let DateAdded:String?
}


struct Hours:Decodable {
    let hourId:Int
    let totalHour:Double
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
    @Published var userId = Int()
    @Published var totalHours = ""
    var totalMoney = Double()
    var didChange = PassthroughSubject<AuthUser, Never>()
    @Published  var UserHours = [Hours]()
    @Published var isLoading: Bool = false
    
    
    @Published var isCorrect: Bool = true
    
    //2. run state
    @Published var isLoggedIn:Bool = false {
        didSet {
            didChange.send(self)
        }
    }
    @Published var isUser:Int = 0
    
 
    

    
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
                        self.isLoggedIn = true
                        self.name = result.userName
                        self.userId = result.userId
                        self.totalMoney = result.TotalEarned
                        self.totalHours = result.TotalHours
                        self.isUser = result.userId
                        self.isLoading = false
                    }
                    
                    else{
                        self.isLoggedIn = false
                        self.isCorrect = false
                        print("User was not found")
                    }
                }
            }
            else{
//                print("user was not found")
                DispatchQueue.main.async {
                    self.isCorrect = false
                    self.isLoading = false
                }
              
            }
            
        }.resume()
    }
    
    
    
    func GetTotalHours(userId:Int) {
        //make a get function to get all the hours from the user
        guard let url = URL(string: "https://myworktimetracker.herokuapp.com/api/getUserHours/\(userId)") else{return}
//        let body = ["userId":self.userId]
//        guard let finalBody = try? JSONEncoder().encode(body) else{return}
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
//        request.httpBody = finalBody
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do{
                if let NewData = data{
                    let decodeData = try JSONDecoder().decode([Hours].self, from: NewData)
                    DispatchQueue.main.async {
                        self.UserHours = decodeData
                        
                    }
                }
                else{
                    print("error")
                }
            }
            catch{
                print("\(error.localizedDescription)")
            }
        }.resume()
        
    }
}
