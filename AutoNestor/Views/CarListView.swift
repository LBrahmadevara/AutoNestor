//
//  CarListView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI

struct CarListView: View {
    var carModel: String
    var Audi: [String]
    let audiA3 = [["title": "2021 Audi A3 Premium", "Price" : "$60,000", "Image": "a1"],
                  ["title": "2021 Audi A3 Premium", "Price" : "$65,000", "Image": "a2"],
                  ["title": "2020 Audi A3 Premium", "Price" : "$50,000", "Image": "a3"],
                  ["title": "2020 Audi A3 Premium", "Price" : "$55,000", "Image": "a4"],
                  ["title": "2019 Audi A3 Premium", "Price" : "$50,000", "Image": "a1"],
                  ["title": "2018 Audi A3 Premium", "Price" : "$57,000", "Image": "a2"]]
    @State var isHearted = [false, false, false, false, false, false]
    
    var body: some View {
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                ForEach(0..<audiA3.count){
                    index in
                    NavigationLink(
                        destination: CarDescView(title: audiA3[index]["title"] ?? "", price: audiA3[index]["Price"] ?? "", image: audiA3[index]["Image"] ?? ""),
                        label: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Image(audiA3[index]["Image"] ?? "car")
                                    .resizable()
                                    .frame(width: 220, height: 130)
                                    .scaledToFill()
                                    .cornerRadius(3)
                                    .shadow(radius: 4)
                                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Text(audiA3[index]["title"] ?? "")
                                        .font(.title3)
                                        .padding(.top, 3)
                                        .padding(.bottom, 3)
                                    Text(audiA3[index]["Price"] ?? "")
                                    Spacer()
                                    HStack{
                                        Spacer()
                                        Button(action:{
                                            if isHearted[index]{
                                                isHearted[index] = false
                                            }
                                            else{
                                                isHearted[index] = true
                                            }
                                        }, label:{
                                            Image(systemName: isHearted[index] ? "heart.fill" : "heart")
                                                .resizable()
                                                .frame(width: 20, height:20)
                                        }).foregroundColor(Color(.label))
                                    }
                                }).padding(.leading, 2)
                                Spacer()
                            })
                        })
                        .foregroundColor(Color(.label))
                    Divider()
                }
                .padding(.vertical, 4)
                .padding(.horizontal, 10)
            })
            .navigationBarTitle("\(carModel)")
        }
    }
}

struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CarListView(carModel: "Audi A3", Audi: ["Audi A3"])
        }
    }
}
