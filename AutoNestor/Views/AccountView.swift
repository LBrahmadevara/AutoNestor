//
//  AccountView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/16/21.
//

import SwiftUI

struct AccountView: View {
    @State var fName = "Likhitha"
    @State var lName = "Brahmadevara"
    @State var email = "abc@gmail.com"
    @State var password = "abcdef"
    @State var handleUpdate = false
    @State var notification = false
    @State var isLoggedOut = false
    var body: some View {
//        NavigationView{
            ScrollView{
                VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("First Name:")
                            .font(.system(size: 21))
                            .padding(.trailing)
                        Spacer()
                        TextField("", text: $fName)
                            .font(.system(size: 20))
                            .padding(10)
                            .border(Color.black, width: 2)
                            .cornerRadius(4)
                    })
                    .padding(15)
                    .padding(.top)
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("Last Name:")
                            .font(.system(size: 21))
                            .padding(.trailing)
                        Spacer()
                        TextField("", text: $lName)
                            .font(.system(size: 20))
                            .padding(10)
                            .border(Color.black, width: 2)
                            .cornerRadius(4)
                    })
                    .padding(15)
                    .padding(.top, -5)
                    //                    .padding(.horizontal, 30)
                    
                    HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("Email:")
                            .font(.system(size: 21))
                            .padding(.trailing)
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        Spacer()
                        TextField("", text: $email)
                            .font(.system(size: 20))
                            .padding(10)
                            .border(Color.black, width: 2)
                            .cornerRadius(4)
                    })
                    .padding(15)
                    .padding(.top, -5)
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Text("Password:")
                            .font(.system(size: 21))
                            .padding(.trailing)
                        Spacer()
                        Spacer()
                        SecureField("", text: $password)
                            .font(.system(size: 20))
                            .padding(10)
                            .border(Color.black, width: 2)
                            .cornerRadius(4)
                    })
                    .padding(15)
                    .padding(.top, -5)
                    
                    HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        Spacer()
                        Button(action: {
                            notification.toggle()
                            //                            handleUpdate.toggle()
                            //                            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                            //                                handleUpdate.toggle()
                            //                            }
                        }, label: {
                            Text("UPDATE")
                                .font(.system(size: 18))
                                .fontWeight(.bold)
                        })
                        .alert(isPresented: $notification, content: {
                            Alert(title: Text("Details Updated"), message: Text(""), dismissButton: .default(Text("OK")))
                        })
                        
                        
                        Spacer()
                    })
                    .padding()
                    .padding(.horizontal, 50)
                    .background(Color(.black))
                    .foregroundColor(.white)
                    .cornerRadius(5)
                    .padding()
                    
                    NavigationLink(
                        destination: ContentView(),
                        label: {
                            HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Spacer()
                                Text("LOGOUT")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                Spacer()
                            })
                            .padding()
                            .padding(.horizontal, 50)
                            .background(Color(.black))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                            .padding(.horizontal)
                        })
                })
            }
//            .navigationBarTitle("Edit Profile")
            
//        }
    }
    
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
