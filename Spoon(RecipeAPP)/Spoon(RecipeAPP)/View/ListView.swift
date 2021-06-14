//
//  ListView.swift
//  Spoon(RecipeAPP)
//
//  Created by Pedro Alejandro on 12/25/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListView: View {
    var data: Results
    let array = ["Breakfast", "Lunch", "Dessert"]
    var body: some View {
        VStack{
            ForEach(array, id: \.self){ i in
                Button(action: {
                    if i == "Breakfast"{
                        print("Break Fast")
                    }
                    
                    else if i == "Lunch"{
                        print("Lunch")
                    }
                    
                    else{
                        print("Dessert")
                    }
                }, label: {
                        Text(i)
                })
            }
        }
        
    }
}


