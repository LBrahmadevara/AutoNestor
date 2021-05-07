//
//  FilterView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI

struct FilterView: View {
    @Environment(\.colorScheme) var colorScheme
    
    let bodyType = ["None", "Coupe", "Convertible", "Sedan"]
    let driveType = ["None", "4WD", "AWD", "FWD"]
    let fuelType = ["None", "Gas", "Diesel", "Electric"]
    let color = ["None", "Blue", "Red", "Black", "White"]
    
    @State var minPrice = ""
    @State var maxPrice = ""
    @State var minYear = ""
    @State var maxYear = ""
    @State private var isExpandedBT = false
    @State private var selectedValueBT = "None"
    @State private var isExpandedDT = false
    @State private var selectedValueDT = "None"
    @State private var isExpandedFT = false
    @State private var selectedValueFT = "None"
    @State private var isExpandedC = false
    @State private var selectedValueC = "None"
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: .center, spacing: nil, content: {
                
                // Price
                HStack{
                    Text("Price")
                        .font(.system(size: 22))
                        .bold()
                        .padding(10)
                        .padding(.leading, 5)
                    Spacer()
                }
                HStack{
                    TextField("Min", text: $minPrice)
                        .padding()
                        .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                        .cornerRadius(4)
                        .padding(.leading)
                    TextField("Max", text: $maxPrice)
                        .padding()
                        .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                        .cornerRadius(4)
                        .padding(.trailing)
                        .padding(.leading, 5)
                }
                
                // Year
                HStack{
                    Text("Year")
                        .font(.system(size: 22))
                        .bold()
                        .padding(10)
                        .padding(.leading, 5)
                    Spacer()
                }
                HStack{
                    TextField("Min", text: $minYear)
                        .padding()
                        .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                        .cornerRadius(4)
                        .padding(.leading)
                    TextField("Max", text: $maxYear)
                        .padding()
                        .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                        .cornerRadius(4)
                        .padding(.trailing)
                        .padding(.leading, 5)
                }
                
                // Body Type
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Body Type")
                        .font(.system(size: 22))
                        .bold()
                        .padding(8)
                        .padding(.leading, 10)
                    DisclosureGroup("\(selectedValueBT)", isExpanded: $isExpandedBT){
                        ForEach(0..<bodyType.count){
                            num in
                            Divider().padding(.top, 10)
                            HStack{
                                Text("\(bodyType[num])")
                                    .font(.system(size: 18))
                                    .padding(.top, 10)
                                    .onTapGesture {
                                        self.selectedValueBT = bodyType[num]
                                        withAnimation{
                                            self.isExpandedBT.toggle()
                                        }
                                        
                                    }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                    .cornerRadius(4)
                    .padding(.horizontal)
                })
                
                
                // Drive Type
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Drive Type")
                        .font(.system(size: 22))
                        .bold()
                        .padding(8)
                        .padding(.leading, 10)
                    DisclosureGroup("\(selectedValueDT)", isExpanded: $isExpandedDT){
                        ForEach(0..<driveType.count){
                            num in
                            Divider().padding(.top, 10)
                            HStack{
                                Text("\(driveType[num])")
                                    .font(.system(size: 18))
                                    .padding(.top, 10)
                                    .onTapGesture {
                                        self.selectedValueDT = driveType[num]
                                        withAnimation{
                                            self.isExpandedDT.toggle()
                                        }
                                        
                                    }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                    .cornerRadius(4)
                    .padding(.horizontal)
                })
                
                
                // Fuel Type
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Fuel Type")
                        .font(.system(size: 22))
                        .bold()
                        .padding(8)
                        .padding(.leading, 10)
                    DisclosureGroup("\(selectedValueFT)", isExpanded: $isExpandedFT){
                        ForEach(0..<fuelType.count){
                            num in
                            Divider().padding(.top, 10)
                            HStack{
                                Text("\(fuelType[num])")
                                    .font(.system(size: 18))
                                    .padding(.top, 10)
                                    .onTapGesture {
                                        self.selectedValueFT = fuelType[num]
                                        withAnimation{
                                            self.isExpandedFT.toggle()
                                        }
                                        
                                    }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                    .cornerRadius(4)
                    .padding(.horizontal)
                })
                
                
                // Color
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("Color")
                        .font(.system(size: 22))
                        .bold()
                        .padding(8)
                        .padding(.leading, 10)
                    DisclosureGroup("\(selectedValueC)", isExpanded: $isExpandedC){
                        ForEach(0..<color.count){
                            num in
                            Divider().padding(.top, 10)
                            HStack{
                                Text("\(color[num])")
                                    .font(.system(size: 18))
                                    .padding(.top, 10)
                                    .onTapGesture {
                                        self.selectedValueC = color[num]
                                        withAnimation{
                                            self.isExpandedC.toggle()
                                        }

                                    }
                                Spacer()
                            }
                        }
                    }
                    .padding()
                    .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                    .cornerRadius(4)
                    .padding(.horizontal)
                })

                
                // Done Button
                HStack{
                    NavigationLink(
                        destination: HomePageView(),
                        label: {
                            Text("DONE")
                                .font(.system(size: 20))
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(colorScheme == .dark ? Color.black : Color.white)
                                .background(colorScheme == .dark ? Color.white : Color.black)
                                .cornerRadius(4)
                                .padding(.top)
                        })
                }
                .padding()
                .padding(.top, -4)
            })
            .navigationTitle("Filters")
            .navigationBarItems(trailing: Button(action: {
                minPrice = ""
                maxPrice = ""
                minYear = ""
                maxYear = ""
                selectedValueBT = "None"
                selectedValueDT = "None"
                selectedValueFT = "None"
                selectedValueC = "None"
            }, label: {
                Text("Clear Filters")
                    .foregroundColor(.black)
            }))
        }
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FilterView()
        }
        .preferredColorScheme(.light)
    }
}
