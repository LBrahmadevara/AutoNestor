//
//  NavBarBottom.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/28/21.
//

import SwiftUI

struct NavBarBottom: View {
    @Environment(\.colorScheme) var colorScheme
    @State var selectedTab = 1
    @State var tabBarImageNames = ["person.fill", "house.fill", "heart.fill"]
    @State var tabNames = ["Account", "Home", "Favorites"]
    
    var body: some View {
        ZStack{
            NavigationView{
                TabView (selection: $selectedTab){
                    AccountView()
                        .tabItem { VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image(systemName: "person.fill")
                            Text("Account")
                        }) }
                        .tag(0)
                    HomePageView()
                        .tabItem { VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image(systemName: "house.fill")
                            Text("Home")
                        }) }
                        .tag(1)
                    FavoritesView()
                        .navigationBarHidden(true)
                        .tabItem { VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image(systemName: "heart.fill")
                            Text("Favorites")
                        }) }
                        .tag(2)
                }
                .navigationBarTitle("Edit Profile")
            }
        }
        .accentColor(colorScheme == .dark ? Color.white : Color.black)
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
        .navigationBarHidden(true)
    }
    
}

struct NavBarBottom_Previews: PreviewProvider {
    static var previews: some View {
        NavBarBottom()
            .preferredColorScheme(.dark)
    }
}

