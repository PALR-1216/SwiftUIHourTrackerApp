//
//  ContentView.swift
//  Intake
//
//  Created by Pedro Alejandro on 1/31/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var data = Data()
    @State var addingData = false

    var body: some View {
        NavigationView{
            List{
                ForEach(data.items, id:\.id){ i in
                    HStack(){
                        NavigationLink(destination: DataView(data: i)) {
                            Text(i.typeOfFood)
                                .fontWeight(.semibold)
                            Spacer()
                            Text("Carbs")
                            Text("\(i.carbs)")
                                .fontWeight(.bold)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Counter")
            .navigationBarItems(trailing: Button(action: {
                self.addingData.toggle()
            }, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
            }))
        }
        .sheet(isPresented: $addingData, content: {
            AddData(data: self.data)
        })
    }
    
    //MARK: - Remove Item function
    func removeItems(at offset: IndexSet){
        data.items.remove(atOffsets: offset)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

