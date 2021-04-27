//
//  ContentView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
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
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                                    .cornerRadius(6.0)
                            })
                        Spacer()
                        NavigationLink(
                            destination: RegisterView(),
                            label: {
                                Text("REGISTER")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 2.5)
                                    .cornerRadius(6.0)
                            })
                    })
                    .padding(.top)
                    .padding(.horizontal)
                    
                }
                .navigationBarHidden(true)
            }
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
