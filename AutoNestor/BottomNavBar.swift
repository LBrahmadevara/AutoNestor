//
//  BottomNavBar.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI

struct BottomNavBar: View {
    @State var selectedIndex = 1
    var isLoggedOut: Bool
    let tabBarImageNames = ["person.fill", "house.fill", "heart.fill"]
    
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
//                switch selectedIndex{
////                switch selectIndex{
//                case 0:
//                    AccountView()
//                case 1:
//                    HomePageView()
//                case 2:
//                    FavoritesView()
//                case 3:
//                    ContentView()
//                default:
//                    ContentView()
//                }
            }
            Spacer()
            
            if !isLoggedOut{
                HStack{
                    ForEach(0..<tabBarImageNames.count){
                        num in
                        Button(action: {
                            selectedIndex = num
                            
                        }, label: {
                            Spacer()
                            Image(systemName: tabBarImageNames[num])
                                .font(.system(size: 35, weight: .bold))
                                .foregroundColor(selectedIndex == num ? Color(.label) : Color(.lightGray))
                            Spacer()
                        })
                    }
                }
                .padding(.vertical, 20)
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
