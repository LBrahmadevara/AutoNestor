//
//  ConfirmPswd.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/26/21.
//

import SwiftUI

struct ConfirmPswd: View {
    @State var pswd = ""
    @State var confirmPswd = ""
    @State var showAlert = false
    @State var handleSubmit = false
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Please enter your new password here.")
                .bold()
                .font(.system(size: 20))
                .padding(.bottom)
            TextField("Password", text: $pswd)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            TextField("Confirm password", text: $confirmPswd)
                .padding()
                .border(Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            NavigationLink(
                destination: LoginView(),
                isActive: $handleSubmit,
                label: {
                    Button(action: {
                        showAlert.toggle()
                    }, label: {
                        Text("Submit").bold()
                            .font(.system(size: 21))
                            .accentColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                    })
                    .alert(isPresented: $showAlert, content: {
                        Alert(title: Text("Success"), message: Text("Password has updated successfully."), dismissButton: .default(Text("OK"), action: {
                            handleSubmit.toggle()
                        }))
                    })
                })
                .background(Color.black)
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
    }
}
