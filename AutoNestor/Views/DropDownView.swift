//
//  DropDownView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/14/21.
//

import SwiftUI

struct DropDownView: View {
    @State private var isExpanded = false
    @State private var selectedValue = "None"
    @State private var title = "Body Type"
    let bodyType = ["Coupe", "Convertible", "Sedan"]
    
//    var values: String
//    var titles: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
//            Text("\(title)")
//                .font(.system(size: 22))
//                .bold()
//                .padding(8)
//                .padding(.leading, 10)
            DisclosureGroup("\(selectedValue)", isExpanded: $isExpanded){
                ForEach(0..<bodyType.count){
                    num in
                    Divider().padding(.top, 10)
                    HStack{
                        Text("\(bodyType[num])")
                            .font(.system(size: 18))
                            .padding(.top, 10)
                            .onTapGesture {
                                self.selectedValue = bodyType[num]
                                withAnimation{
                                    self.isExpanded.toggle()
                                }
                                
                            }
                        Spacer()
                    }
                }
            }
            .padding()
            .border(Color.black, width: 2)
            .cornerRadius(4)
            .padding(.horizontal)
//            .padding(.trailing, 120)
            Spacer()
            
        })
    }
}

struct DropDownView_Previews: PreviewProvider {
    static var previews: some View {
        DropDownView()
    }
}
