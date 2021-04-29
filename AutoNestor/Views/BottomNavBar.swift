//
//  BottomNavBar.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI
import Combine

struct BottomNavBar: View {
    @State var selectedIndex = 1
    var isLoggedOut: Bool
    let tabBarImageNames = ["person.fill", "house.fill", "heart.fill"]
    @State var tabNames = ["Account", "Home", "Favorites"]
    
    var body: some View {
                VStack{
                    Spacer()
                    ZStack{
                        if isLoggedOut{
                            ContentView()
                        }
                        else{
                            switch selectedIndex{
                            case 0:
                                AccountView()
                            case 1:
                                HomePageView()
                            case 2:
                                FavoritesView()
                            default:
                                ContentView()
                            }
                        }
                    }
                    Spacer()
        
                    if isLoggedOut == false{
        
                        HStack{
                            ForEach(0..<tabBarImageNames.count){
                                num in
                                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                    Button(action: {
                                        self.selectedIndex = num
                                        
                                    }, label: {
                                        Spacer()
                                        Image(systemName: tabBarImageNames[num])
                                            .font(.system(size: 28, weight: .bold))
                                            .foregroundColor(selectedIndex == num ? Color(.label) : Color(.lightGray))
                                        Spacer()
                                    })
                                    Text(tabNames[num])
                                        .font(.system(size: 15))
                                        .foregroundColor(selectedIndex == num ? Color(.label) : Color(.lightGray))
                                })
                            }
                        }
                        .padding(.vertical, 15)
                        .background(Color(.systemGray6))
                    }
        
        
        
        
        
                    //            HStack{
                    //                ForEach(0..<tabBarImageNames.count){
                    //                    num in
                    //                    Button(action: {
                    //                        selectedIndex = num
                    //                    }, label: {
                    //                        Spacer()
                    //                        Image(systemName: tabBarImageNames[num])
                    //                            .font(.system(size: 35, weight: .bold))
                    //                            .foregroundColor(selectedIndex == num ? Color(.label) : Color(.lightGray))
                    //                        Spacer()
                    //                    })
                    //                }
                    //            }
                    //            .padding(.vertical, 20)
                    //            .background(Color(.systemGray6))
        
        
                }
                .edgesIgnoringSafeArea(.all)
                .navigationBarHidden(true)
    }
    
}

struct BottomNavBar_Previews: PreviewProvider {
    static var previews: some View {
        BottomNavBar(isLoggedOut: false)
    }
}
