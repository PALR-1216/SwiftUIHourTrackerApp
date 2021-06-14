//
//  Data.swift
//  Intake
//
//  Created by Pedro Alejandro on 1/31/21.
//

import Foundation

struct Intake: Decodable, Identifiable, Encodable {
    var id = UUID()
    var typeOfFood: String
    var carbs: Int
    var calories: Int
    var totalCarbs: Int
}

class Data: ObservableObject{
    @Published var items = [Intake](){
        didSet{
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "items")
            }
        }
    }
    
    init() {
        if let data = UserDefaults.standard.data(forKey: "items"){
            let decoded = JSONDecoder()
            if let decoded = try? decoded.decode([Intake].self, from: data){
                self.items = decoded
                print(decoded)
                return
            }
        }
        self.items = []
    }
}
