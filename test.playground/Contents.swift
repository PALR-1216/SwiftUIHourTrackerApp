import UIKit

import Foundation

let header = [
    "x-rapidapi-key": "27861ab90bmsheac70c40a839f05p1b3f9djsne10340ae56eb",
    "x-rapidapi-host": "free-nba.p.rapidapi.com"
]

var request = URLRequest(url: URL(string: "https://free-nba.p.rapidapi.com/teams")!)

request.httpMethod = "GET"
request.allHTTPHeaderFields = header
URLSession.shared.dataTask(with: request){ data, res, er in
    if er != nil{
        print((er?.localizedDescription)!)
        return
    }
    else{
        print(res)
    }

    if let data = data{
        if let json =  try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as? [String: Any]
        {
            print(json)
        }
    }

}.resume()



//class GetData:ObservableObject{
//    @Published var data = [Data]()
//
//    init() {
//        fetch()
//    }
//
//    func fetch(){
//
//        let header = [
//            "x-rapidapi-key": "27861ab90bmsheac70c40a839f05p1b3f9djsne10340ae56eb",
//            "x-rapidapi-host": "free-nba.p.rapidapi.com"
//        ]
//
//        var request = URLRequest(url: URL(string: "https://free-nba.p.rapidapi.com/teams")!)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = header
//        URLSession.shared.dataTask(with: request) { (data, res, err) in
//            if err != nil{
//                print(err?.localizedDescription)
//                return
//            }
//
//            else{
//                print(res)
//            }
//
//            if let json = try? JSONDecoder().decode(Model.self, from: data!){
//                print(json)
//            }
//        }.resume()
//    }
//
//}



struct Model: Decodable{
    var data:[Data]
}


struct Data: Decodable, Identifiable{
    var id = UUID()
    var city: String
    var conference: String
    var full_name: String
}


