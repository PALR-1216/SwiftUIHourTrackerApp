//
//  GetData.swift
//  Spoon(RecipeAPP)
//
//  Created by Pedro Alejandro on 12/25/20.
//

import Foundation


struct Model: Decodable {
    var results: [Results]
}


struct Results: Decodable, Hashable {
    var id: Int
    var title: String
    var image: String
}


class GetData: ObservableObject{
    @Published var  result = [Results]()
    
    
    func fetchData() {
        guard let url = URL(string: "https://api.spoonacular.com/recipes/complexSearch?apiKey=013fec10b7b24cde8a8ba7f3f12afa87&type=breakfast&number=210") else{return}
        URLSession.shared.dataTask(with: url) { (data, _, err) in
            guard let data = data, err == nil else {return}
            let response = try? JSONDecoder().decode(Model.self, from: data)
            if let Decoded = response{
                DispatchQueue.main.async {
                    self.result = Decoded.results
                }
            }
        }.resume()
    }
}
