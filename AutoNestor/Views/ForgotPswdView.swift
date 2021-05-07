//
//  ForgotPswdView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/26/21.
//

import SwiftUI

enum ActiveAlert {
    case first, second
}

struct ForgotPswdView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var email: String = ""
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    @State var handleEmail = false
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Please enter the email linked to your account")
                .bold()
                .font(.system(size: 20))
                .padding(.bottom)
            TextField("Email address", text: $email)
                .padding()
                .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
                .font(.system(size: 18))
            
            NavigationLink(
                destination: ForgotCode(),
                isActive: $handleEmail,
                label: {
                    Button(action: {
                        if email == ""{
                            self.activeAlert = .first
                        }
                        else{
                            self.activeAlert = .second
                        }
                        self.showAlert = true
                    }, label: {
                        Text("Next").bold()
                            .font(.system(size: 21))
                            .accentColor(colorScheme == .dark ? Color.black : Color.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    })
                    .alert(isPresented: $showAlert, content: {
                        switch activeAlert{
                        case .first:
                            return Alert(title: Text("Error"), message: Text("Please enter your email"), dismissButton: .default(Text("OK")))
                        case .second:
                            return Alert(title: Text("Success"), message: Text("Code has been sent to your email"), dismissButton: .default(Text("OK"), action: {
                                handleEmail.toggle()
                            }))
                        }
                    })
                })
                .background(colorScheme == .dark ? Color.white : Color.black)
                .cornerRadius(4)
            Spacer()
        })
        .padding()
    }
}

struct ForgotPswdView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ForgotPswdView()
        }
        .preferredColorScheme(.dark)
    }
}
