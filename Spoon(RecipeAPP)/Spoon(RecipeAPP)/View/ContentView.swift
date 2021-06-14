//
//  ContentView.swift
//  Spoon(RecipeAPP)
//
//  Created by Pedro Alejandro on 12/25/20.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var data = GetData()
    let array = ["Breakfast", "Lunch", "Dessert"]
    var body: some View {
        NavigationView{
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
            .navigationTitle("MyRecipe")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
