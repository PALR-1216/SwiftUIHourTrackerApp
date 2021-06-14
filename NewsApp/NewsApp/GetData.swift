//
//  GetData.swift
//  NewsApp
//
//  Created by Pedro Alejandro on 12/31/20.
//https://newsapi.org/v2/top-headlines?country=us&apiKey=006ae0fd5fc74acd89361ba32c12ddb1

import Foundation
import SwiftyJSON



struct Model:Decodable {
    var articles: [Articles]
}

struct Articles: Decodable, Hashable {
    var author: String
    var title: String
    var description:String
    var url:String
    var urlToImage:String
}


class GetData:ObservableObject{
    @Published var article = [Articles]()
    
    init() {
        find()
    }
    
    
    
    func find() {
        let url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=006ae0fd5fc74acd89361ba32c12ddb1"
        URLSession.shared.dataTask(with: URL(string: url)!) { (data, _, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            
            let json = try! JSON(data: data!)
            let items = json["articles"].array!
            
            for i in items{
                
                let author = i["author"].stringValue
                let title = i["title"].stringValue
                let description = i["description"].stringValue
                let url = i["url"].stringValue
                let urlToImage = i["urlToImage"].stringValue
                
                DispatchQueue.main.async {
                    self.article.append(Articles(author: author, title: title, description: description, url: url, urlToImage: urlToImage))
                }
            }
        }.resume()
    }
    
    
    
//    func fetch() {
//
//        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=006ae0fd5fc74acd89361ba32c12ddb1") else{return}
//        URLSession.shared.dataTask(with: url) { (data, _, err) in
//            guard let data = data, err == nil else{return}
//            let response = try? JSONDecoder().decode(Model.self, from: data)
//            if let decoded = response{
//                DispatchQueue.main.async {
//                    self.article = decoded.articles
//                }
//            }
//        }.resume()
//    }
}
