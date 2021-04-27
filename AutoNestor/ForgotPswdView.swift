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
    @State var email: String = ""
    @State private var showAlert = false
    @State private var activeAlert: ActiveAlert = .first
    @State var handleEmail = false
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Please enter the email to recover the password.")
                .bold()
                .font(.system(size: 20))
                .padding(.bottom)
            TextField("Email address", text: $email)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            
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
                            .accentColor(.white)
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
                .background(Color.black)
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
    }
}
