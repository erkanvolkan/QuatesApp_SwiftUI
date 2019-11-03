//
//  ContentView.swift
//  QuatesApp
//
//  Created by Erkan on 9/4/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   
    var quotes: [Quote]
    
    var body: some View {
        VStack{
            circleImage(imageName: "lilly")
                .frame(width: 160 , height: 160)
//                .padding(.top,150)
//                .padding(.bottom,20)
            MainView(quotes: quotes)
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(
                Image("motivation")
            
                    .resizable()
                    .renderingMode(.original)
                    .edgesIgnoringSafeArea(.all)
                    
        
        )
    }
}
struct circleImage: View {
    var imageName: String
    var body: some View{
       
        VStack{
            Image(imageName)
                .resizable()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.gray,lineWidth: 2))
                .shadow(radius: 10)
            
            
            }
    }
}

struct MainView: View {
    
    var quotes: [Quote]
    
    var body: some View{
        VStack {
            HStack{
                Text("\(self.quotes.count) Quotes !")
                    .font(.subheadline)
                    .bold()
                    .foregroundColor(.red)
            }
        
            ScrollView(.horizontal,showsIndicators: false){
                HStack{
                    ForEach(self.quotes,id: \.name) { quote in
                       
                        VStack{
                            circleImage(imageName: "lilly")
                                .frame(width: 100, height: 100)
                         
                        
                            Text(#" " \#(quote.quote) " "#)
                                .lineLimit(Int.max)
                                .font(.headline)
                           

                            Divider()
                            Text(quote.name)
                                .italic()
                                .font(.custom("Helvetica neue", size: 25))
                                .font(.largeTitle)
                    
                    
                            }
                                .frame(width: 300, height: 300)
                                .foregroundColor(Color.black)
                                .padding(4)
                                .background(Color.init(red: 20, green: 255, blue: 0))
                                .cornerRadius(15)
                                .overlay(
                                    Rectangle()
                                .fill(
                                    LinearGradient(gradient: Gradient(colors: [.clear, .yellow]),startPoint: .topLeading,endPoint: .bottomLeading)
                                )
                                .clipped()
                                .shadow(radius: 8)
                                )
                            
                    
                    }
               
                }
            }
        }
    }
}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(quotes: quoteData)
//    }
//}
