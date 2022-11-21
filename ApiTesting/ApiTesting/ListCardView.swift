//
//  ListCardView.swift
//  ApiTesting
//
//  Created by Pedro Alejandro on 10/2/22.
//

import SwiftUI
import SDWebImageSwiftUI

struct ListCardView: View {
    @State var image:String
    @State var earthDate:String
    var body: some View {
        
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .strokeBorder(Color.gray, lineWidth:1)
                .frame(width: 150, height: 174)
                .background(Color.white)
            
            VStack(alignment: .leading, spacing:10){
                WebImage(url: URL(string: image))
                    .resizable()
                      .aspectRatio(contentMode: .fill)
                      .frame(width: 170, height: 116)
                      .clipped()
                
                VStack{
                    Text(earthDate)
                        .font(.custom("Avenir", size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.horizontal,12)
                .padding(.bottom,11)
                
            }
            .frame(width: 170, height: 174)
            .cornerRadius(5)
        }
        
    }
}

//struct ListCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListCardView()
//    }
//}
