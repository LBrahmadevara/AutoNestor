//
//  CarModelView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI

struct CarModelView: View {
    var car: String
    @State var search: String = ""
    @State var isSearching = false
    let Audi = ["Select All", "Audi A3", "Audi A4", "Audi A4 Premium", "Audi A4 Premium Plus", "Audi A5", "Audi A6", "Audi A7", "Audi A8", "Audi Q3", "Audi Q5", "Audi Q7", "Audi Q8", "Audi S3", "Audi S4", "Audi S5", "Audi S8"]
    
    let BMW = ["Select All", "128", "135", "228", "230", "320", "328", "330", "330 Plug in Hybrid", "335", "340", "428", "428", "430", "435", "440", "528", "530", "535", "540", "550", "640", "650", "740", "750"]
    
    let Chevrolet = ["Avalanche 1500", "Blazer", "Bolt EV", "Camaro", "Captiva Sport", "Cobalt", "Corvette", "Cruze", "Equinox", "Express 2500", "HHR", "Impala", "Malibu", "Malibu Hybrid", "SS", "Silverado 1500", "Sonic", "Spark", "Spark EV", "Traverse", "Volt"]
    
    var body: some View {
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
            
            if car == "Audi"{
                ForEach( Audi.filter { search.isEmpty || $0.localizedStandardContains(search)}, id: \.self) { item in
                    HStack{
                        NavigationLink(
                            destination: CarListView(carModel: item, Audi: Audi),
                            label: {
                                Text(item)
                            }).foregroundColor(.black)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.horizontal)
                }
            }
            else if car == "Chevrolet"{
                ForEach( Chevrolet.filter { search.isEmpty || $0.localizedStandardContains(search)}, id: \.self) { item in
                    HStack{
                        NavigationLink(
                            destination: CarListView(carModel: item, Audi: Audi),
                            label: {
                                Text(item)
                            }).foregroundColor(.black)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.horizontal)
                }
            }
            else if car == "BMW"{
                ForEach( BMW.filter { search.isEmpty || $0.localizedStandardContains(search)}, id: \.self) { item in
                    HStack{
                        NavigationLink(
                            destination: CarListView(carModel: item, Audi: Audi),
                            label: {
                                Text(item)
                            }).foregroundColor(.black)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.horizontal)
                }
            }
            else{
                ForEach( Audi.filter { search.isEmpty || $0.localizedStandardContains(search)}, id: \.self) { item in
                    HStack{
                        NavigationLink(
                            destination: CarListView(carModel: item, Audi: Audi),
                            label: {
                                Text(item)
                            }).foregroundColor(.black)
                        Spacer()
                    }.padding()
                    Divider()
                        .background(Color(.systemGray4))
                        .padding(.horizontal)
                }
            }
            
            
        }
        
        
        .navigationBarTitle("\(car)")
        .navigationBarItems(trailing:
                NavigationLink(
                    destination: FilterView(),
                    label: {
                        HStack{
                            Image(systemName: "square.and.pencil")
                                .foregroundColor(Color(.label))
                            Text("Filters")
                                .foregroundColor(.black)
                        }
                    })
        )
    }
}

struct CarModelView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CarModelView(car: "Audi")
        }
    }
}
