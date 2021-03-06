//
//  ForgotCode.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/26/21.
//

import SwiftUI

struct ForgotCode: View {
    @Environment(\.colorScheme) var colorScheme
    @State var code = ""
    var body: some View {
        VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
            Text("Enter the code that has been sent to your Email")
                .bold()
                .font(.system(size: 20))
                .padding(.bottom)
            TextField("Code", text: $code)
                .padding()
                .border(colorScheme == .dark ? Color.white : Color.black, width: 2)
                .cornerRadius(4)
                .padding(.bottom)
            NavigationLink(
                destination: ConfirmPswd(),
                label: {
                    Text("Next").bold()
                        .font(.system(size: 21))
                        .accentColor(colorScheme == .dark ? Color.black : Color.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                })
                .background(colorScheme == .dark ? Color.white : Color.black)
                .cornerRadius(4)
            Spacer()
        })
        .padding()
    }
}

struct ForgotCode_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ForgotCode()
        }
        .preferredColorScheme(.dark)
    }
}
