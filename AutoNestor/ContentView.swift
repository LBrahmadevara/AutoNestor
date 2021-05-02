//
//  ContentView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            VStack{
                ZStack{
                    Image("Car").resizable().edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        HStack(alignment: .bottom, spacing: nil, content: {
                            Spacer()
                            Text("Auto Nestor")
                                .foregroundColor(.white).bold().font(.system(size: 40, weight: .bold, design: .rounded)).padding(25)
                        })
                    })
                }
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("LOG IN")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .border(colorScheme == .dark ? Color.white : Color.black, width: 2.5)
                                .cornerRadius(6.0)
                        })
                    
                    Spacer()
                    NavigationLink(
                        destination: RegisterView(),
                        label: {
                            Text("REGISTER")
                                .foregroundColor(colorScheme == .dark ? .white : .black)
                                .bold()
                                .padding()
                                .frame(maxWidth: .infinity)
                                .border(colorScheme == .dark ? Color.white : Color.black, width: 2.5)
                                .cornerRadius(6.0)
                        })
                })
                .padding(.top)
                .padding(.horizontal)
                .padding(.bottom, 35)
                
                
            }
            .background(colorScheme == .dark ? Color.black : Color.white)
            .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
//            .background(Color.white)
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
            
    }
}
