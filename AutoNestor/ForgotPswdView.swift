//
//  ForgotPswdView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/26/21.
//

import SwiftUI

struct ForgotPswdView: View {
    @State var email: String = ""
    @State var handleEmail = false
    @State var emptyEmail = false
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
                label: {
                    Button(action: {
                        if email != ""{
                            emptyEmail.toggle()
                        }
                        else{
                            handleEmail.toggle()
                        }
                    }, label: {
                        Text("Next").bold()
                            .font(.system(size: 21))
                            .accentColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
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
