//
//  LoginView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/12/21.
//

import SwiftUI

struct LoginView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var loginAlert = false
    @State var handleLogin = false
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            
            
            TextField("Email address", text: $email)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
                
            SecureField("Password", text: $password)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom, 10)
            
            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                NavigationLink(
                    destination: ForgotPswdView(),
                    label: {
                        Text("Forgot password?")
                    })
            })
            .padding(.bottom, 10)
            
            
            NavigationLink(
                destination: NavBarBottom(),
//                destination: BottomNavBar(isLoggedOut: false),
                isActive: $handleLogin,
                label: {
                    Button(action: {
                        if email == "Abc@gmail.com"{
                            handleLogin.toggle()
                        }
                        else{
                            loginAlert.toggle()
                        }
                    }, label: {
                        Text("LOGIN").bold()
                            .accentColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
//                            .frame(width: 375, height: 50, alignment: .center)
                    })
                    .alert(isPresented: $loginAlert, content: {
                        Alert(title: Text("Login Error"), message: Text("Email and Password mismatch."), dismissButton: .default(Text("OK")))
                    })
                }
            )
            .background(Color(.black)).cornerRadius(4)
            
            Spacer()
        })
        .padding(.horizontal, 20)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
                    ToolbarItem(placement: .principal) {
                        VStack {
                            Text("Log In").font(.system(size: 30, weight: .bold, design: .rounded))
                        }
                    }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            LoginView()
//                .navigationBarHidden(true)
        }
    }
}
