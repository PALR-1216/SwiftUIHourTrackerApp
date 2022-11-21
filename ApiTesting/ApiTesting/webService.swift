//
//  webService.swift
//  ApiTesting
//
//  Created by Pedro Alejandro on 10/2/22.
//

import Foundation
//NASA API KEY wBBCKhZpuMtYeUC4vUNMdXVhR72ylQfR6umz4ObD

struct nasaResponse:Decodable{
    var photos:[NasaPhotos]
    
}

struct NasaPhotos:Decodable {
    var id:Int
    var img_src:String
    var earth_date:String
    var rover:RoverData
}

struct RoverData:Decodable {
    var id:Int
    var name:String
    
}

enum ApiError:Error{
    case dataisNil
}



class webService:ObservableObject{
    @Published var nasa = [NasaPhotos]()
   
    
    func fetchData(){
        
        guard let url = URL(string: "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&api_key=wBBCKhZpuMtYeUC4vUNMdXVhR72ylQfR6umz4ObD") else{return}
        
        URLSession.shared.dataTask(with: url) { data , _ , error in
            guard let data = data, error == nil else {return}
            let response =  try? JSONDecoder().decode(nasaResponse.self, from: data)
            if let dataResponse = response {
                DispatchQueue.main.async {
                    self.nasa = dataResponse.photos
                }
            }
        }.resume()
        
    }
    
}
