//
//  GetData.swift
//  AnimeApp
//
//  Created by Pedro Alejandro on 1/21/21.
//

import Foundation
import SwiftyJSON



struct Model: Decodable {
    var top: [TopResults]
}

struct TopResults : Decodable, Identifiable{
    var id = UUID()
    var mal_id: Int
    var title : String
    var url : String
    var image_url: String
    
}

///anime/{id}(/request)
//https://api.jikan.moe/v3/top/anime?



class GetData: ObservableObject {
    // 1.
    @Published var Data = [TopResults]()
    
    func fetch() {
        let url = "https://api.jikan.moe/v3/top/anime?"
        let session = URLSession(configuration: .default)
        session.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            let items = json["top"].array!
            
            for i in items{
                
                let mal_id = i["mal_id"].intValue
                let title = i["title"].stringValue
                let url = i["url"].stringValue
                let image_url = i["image_url"].stringValue
                DispatchQueue.main.async {
                    self.Data.append(TopResults(mal_id: mal_id, title: title, url: url, image_url: image_url))
                }
            }
        }.resume()
    }
}
