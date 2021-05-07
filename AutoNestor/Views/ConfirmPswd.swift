//
//  ConfirmPswd.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/26/21.
//

import SwiftUI

enum confirmAlert {
    case first, second
}

struct ConfirmPswd: View {
    @Environment(\.colorScheme) var colorScheme
    @State var pswd = ""
    @State var confirmPswd = ""
//    @State var showAlert = false
    @State var handleSubmit = false
    @State private var shwAlert = false
    @State private var activeAlert: confirmAlert = .first
    @State var isShowingCreatePass = false
    @State var isShowingConfirmPass = false

    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Please enter your new password here.")
                .bold()
                .font(.system(size: 20))
                .padding(.bottom)
            
            ZStack{
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if (!isShowingCreatePass){
                        SecureField("Password", text: $pswd)
                            .padding()
                            .font(.system(size: 18))
                    }
                    else{
                        TextField("Password", text: $pswd)
                            .padding()
                            .font(.system(size: 18))
                    }
                    Button(action: {
                        isShowingCreatePass.toggle()
                    }, label: {
                        Image(systemName: isShowingCreatePass ? "eye" : "eye.slash")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }).padding(.trailing)
                })
                .border(colorScheme == .dark ? Color.white : Color.black, width: 2.5)
                .cornerRadius(4)
                .padding(.bottom, 10)
            }
            
            ZStack{
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    if (!isShowingConfirmPass){
                        SecureField("Password", text: $confirmPswd)
                            .padding()
                            .font(.system(size: 18))
                    }
                    else{
                        TextField("Password", text: $confirmPswd)
                            .padding()
                            .font(.system(size: 18))
                    }
                    Button(action: {
                        isShowingConfirmPass.toggle()
                    }, label: {
                        Image(systemName: isShowingConfirmPass ? "eye" : "eye.slash")
                            .foregroundColor(colorScheme == .dark ? .white : .black)
                    }).padding(.trailing)
                })
                .border(colorScheme == .dark ? Color.white : Color.black, width: 2.5)
                .cornerRadius(4)
                .padding(.bottom, 10)
            }
            
            NavigationLink(
                destination: LoginView(),
                isActive: $handleSubmit,
                label: {
                    Button(action: {
                        if pswd != confirmPswd{
                            self.activeAlert = .first
                        }
                        else{
                            self.activeAlert = .second
                        }
                        self.shwAlert = true
                    }, label: {
                        Text("Submit").bold()
                            .font(.system(size: 21))
                            .accentColor(colorScheme == .dark ? Color.black : Color.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    })
                    .alert(isPresented: $shwAlert, content: {
                        switch activeAlert{
                        case .first:
                            return Alert(title: Text("Error"), message: Text("Password mismatch"), dismissButton: .default(Text("OK")))
                        case .second:
                            return Alert(title: Text("Success"), message: Text("Password has updated successfully."), dismissButton: .default(Text("OK"), action: {
                                handleSubmit.toggle()
                            }))
                        }
                        
                    })
//                    .alert(isPresented: $showAlert, content: {
//                        Alert(title: Text("Success"), message: Text("Password has updated successfully."), dismissButton: .default(Text("OK"), action: {
//                            handleSubmit.toggle()
//                        }))
//                    })
                })
//            NavigationLink(
//                destination: LoginView(),
//                isActive: $handleSubmit,
//                label: {
//                    Button(action: {
//                        showAlert.toggle()
//                    }, label: {
//                        Text("Submit").bold()
//                            .font(.system(size: 21))
//                            .accentColor(colorScheme == .dark ? Color.black : Color.white)
//                            .padding()
//                            .frame(maxWidth: .infinity)
//                    })
//                    .alert(isPresented: $showAlert, content: {
//                        Alert(title: Text("Success"), message: Text("Password has updated successfully."), dismissButton: .default(Text("OK"), action: {
//                            handleSubmit.toggle()
//                        }))
//                    })
//                })
                .background(colorScheme == .dark ? Color.white : Color.black)
                .cornerRadius(4)
            Spacer()
        })
        .padding()
    }
}

struct ConfirmPswd_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ConfirmPswd()
        }
        .preferredColorScheme(.light)
    }
}
