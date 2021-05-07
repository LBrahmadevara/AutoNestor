//
//  FavoritesView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/15/21.
//

import SwiftUI

class audiA3Values: ObservableObject {
    @Published var items: Array = [["title": "2021 Audi A3 Premium", "Price" : "$60,000", "Image": "a1"],
                                   ["title": "2021 Chevrolet Malibu", "Price" : "$65,000", "Image": "a2"],
                                   ["title": "2020 Chevrolet Corvette", "Price" : "$50,000", "Image": "a3"],
                                   ["title": "2020 Audi A3 Premium", "Price" : "$55,000", "Image": "a4"]]
    @Published var isHearted: Array = [true, true, true, true]
}

struct FavoritesView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var x = [1,2,3,4]
    @ObservedObject var audiA3 = audiA3Values()
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    ForEach(0..<audiA3.items.count, id:\.self){
                        index in
                        NavigationLink(
                            destination: CarDescView(title: audiA3.items[index]["title"] ?? "", price: audiA3.items[index]["Price"] ?? "", image: audiA3.items[index]["Image"] ?? ""),
                            label: {
                                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Image(audiA3.items[index]["Image"] ?? "car")
                                        .resizable()
                                        .frame(width: 220, height: 130)
                                        .scaledToFill()
                                        .cornerRadius(3)
                                        .shadow(radius: 4)
                                    VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                        Text(audiA3.items[index]["title"] ?? "")
                                            .font(.title3)
                                            .padding(.top, 3)
                                            .padding(.bottom, 3)
                                        Text(audiA3.items[index]["Price"] ?? "")
                                        Spacer()
                                        HStack{
                                            Spacer()
                                            Button(action:{
                                                audiA3.isHearted[index] = false
                                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3){
                                                    removeItems(at: index)
                                                }
                                            }, label:{
                                                Image(systemName: audiA3.isHearted[index] ? "heart.fill" : "heart")
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
                .navigationBarTitle("Favorites")
            }
        }
    }
    func removeItems(at index: Int) {
        audiA3.items.remove(at: index)
        audiA3.isHearted.remove(at: index)
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView()
    }
}
