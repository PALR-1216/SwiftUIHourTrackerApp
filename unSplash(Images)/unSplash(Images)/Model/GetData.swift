//
//  GetData.swift
//  unSplash(Images)
//
//  Created by Pedro Alejandro on 12/27/20.
//RANDOM
//https://api.unsplash.com/photos/random/?count=30&client_id=rXmQdkPKCxb5snwwFkrtvnOrllPaousLM1zLqVtfE7Q
//SEARCH
//https://api.unsplash.com/search/photos/?query=sky&client_id=rXmQdkPKCxb5snwwFkrtvnOrllPaousLM1zLqVtfE7Q

import Foundation


struct Model: Decodable {
    
    var results: [Results]
}

struct Results: Decodable, Hashable {
    var id: String
    var alt_description: String
    var regular : String
    
}


class GetData: ObservableObject{
    @Published var result = [Results]()
     var search = ""
    
    init() {
        find()
    }
    
    func find() {
        guard let url = URL(string: "https://api.unsplash.com/search/photos/?query=sky&client_id=rXmQdkPKCxb5snwwFkrtvnOrllPaousLM1zLqVtfE7Q") else{return}
        
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard let data = data , err == nil else{return}
            let response = try? JSONDecoder().decode(Model.self, from: data)
            if let responsedata = response{
                DispatchQueue.main.async {
                    self.result = responsedata.results
                }
            }
        }.resume()
    }
}
