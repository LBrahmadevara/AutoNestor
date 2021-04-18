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
            VStack{
                ZStack{
                    Image("Car").resizable().edgesIgnoringSafeArea(.all)
                    VStack(alignment: .center, spacing: nil, content: {
                        Spacer()
                        HStack(alignment: .bottom, spacing: nil, content: {
                            Spacer()
                            Text("Auto Nestor").foregroundColor(.white).bold().font(.system(size: 40, weight: .bold, design: .rounded)).padding(25)
                        })
                    })
                }
                HStack(alignment: .center, content: {
                    NavigationLink(
                        destination: LoginView(),
                        label: {
                            Text("LOG IN").foregroundColor(.black).bold().padding(.horizontal, 60).padding(.vertical, 18).border(Color.black, width: 2.5).cornerRadius(6.0)
                        }
                    )
                    .padding(.trailing, 4)
                    NavigationLink(
                        destination: RegisterView(),
                        label: {
                            Text("REGISTER").foregroundColor(.black).bold().padding(.horizontal, 60).padding(.vertical, 18).border(Color.black, width: 2.5).cornerRadius(6.0)
                        })
                })
                .padding(.top, 20)
            }
//            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
