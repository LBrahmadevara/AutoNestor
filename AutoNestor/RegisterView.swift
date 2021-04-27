//
//  RegisterView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/13/21.
//

import SwiftUI

struct RegisterView: View {
    @State var email: String = ""
    @State var createPassword: String = ""
    @State var fisrtName: String = ""
    @State var lastName: String = ""
    @State var confirmPassword: String = ""
    @State var notification = false
    @State var handleRegistration = false
    
    var body: some View {
        VStack(alignment: .center, spacing: nil, content: {
            TextField("First Name", text: $fisrtName)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            
            TextField("Last Name", text: $lastName)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4).padding(.bottom)
            
            TextField("Email address", text: $email)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            
            SecureField("Create Password", text: $createPassword)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4).padding(.bottom)
            
            SecureField("Confirm Password", text: $confirmPassword)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4).padding(.bottom)
            
            NavigationLink(
                destination: ContentView(),
                isActive: $handleRegistration,
                label: {
                    Button(action: {
                        notification.toggle()
                        //                                            notification.toggle()
                        //                                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        //                                                notification.toggle()
                        //                                            }
                    }, label: {
                        Text("REGISTER").bold().accentColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    })
                    .alert(isPresented: $notification, content: {
                        Alert(title: Text("Register Successful"), message: Text("Please Login."), dismissButton: .default(Text("OK"), action: {
                            handleRegistration.toggle()
                        }))
                    })
                    
                }
            ).background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.black/*@END_MENU_TOKEN@*/).cornerRadius(4)
            
            
            
            Spacer()
        })
        .padding(.horizontal, 20)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text("Register").font(.system(size: 30, weight: .bold, design: .rounded))
                }
            }
        }
        //        .overlay(
        //            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
        //                if notification{
        //                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
        //                        Spacer()
        //                        Text("Registration Succesful!!")
        //                            .font(.system(size: 20))
        //                            .bold()
        //                            .foregroundColor(.white)
        //                        Spacer()
        //                    }).padding(23)
        //                    .foregroundColor(.white)
        //                    .background(Color(.black))
        //                }
        //            })
        //            .animation(Animation.easeInOut(duration: 0.3).delay(0.3))
        //            , alignment: .top)
        
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            RegisterView()
        }
    }
}
