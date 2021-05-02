//
//  HomePageView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/13/21.
//

import SwiftUI

struct HomePageView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var search: String = ""
    @State var isSearching = false
    let data = ["Acura", "Audi", "BMW", "Buick", "Cadillac", "Chevrolet", "Dodge", "Fiat", "Ford", "Jaguar", "Jeep", "Kia","Land Rover", "Lexus", "Mazda", "Mercedes-Benz", "Mini", "Mitsubishi", "Nissan", "Porsche", "Ram", "Saturn", "Scion", "Telsa", "Toyota", "Volkswagen", "Volvo"]
    //    @State var isMake = true
    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    HStack{
                        TextField("Search items here..", text: $search)
                            .padding(.leading, 30)
                    }
                    .padding()
                    .background(Color(.systemGray5))
                    .cornerRadius(6)
                    .padding(.horizontal)
                    .onTapGesture {
                        isSearching = true
                    }
                    .overlay(
                        HStack{
                            Image(systemName: "magnifyingglass")
                            Spacer()
                            if isSearching{
                                Button(action: { search = ""}, label: {
                                    Image(systemName: "xmark.circle.fill")
                                })
                            }
                        }
                        .padding(.horizontal, 32)
                        .foregroundColor(.gray)
                    )
                    .transition(.move(edge: .trailing))
                    .animation(.spring())
                    
                    if isSearching{
                        Button(action: {
                            isSearching = false
                            search = ""
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }, label: {
                            Text("Cancel")
                                .padding(.trailing)
                                .padding(.leading, -10)
                        })
                        .transition(.move(edge: .trailing))
                        .animation(.spring())
                    }
                    
                }
                
                ForEach( data.filter { search.isEmpty || $0.localizedStandardContains(search)}, id: \.self) { item in
                    HStack{
                        NavigationLink(
                            destination: CarModelView(car: item),
                            label: {
                                Text(item)
                            }).foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(colorScheme == .dark ? Color(.white) : Color(.systemGray4))
                        .padding(.horizontal)
                }
            }
            .navigationTitle(Text("Select Make"))
            .navigationBarItems(trailing:
                                    NavigationLink(
                                        destination: FilterView(),
                                        label: {
                                            HStack{
                                                Image(systemName: "square.and.pencil")
                                                    .foregroundColor(Color(.label))
                                                Text("Filters")
                                                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                                            }
                                        })
            )
        }
        .navigationBarHidden(true)
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView()
    }
}
