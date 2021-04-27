//
//  CarDescView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/15/21.
//

import SwiftUI

struct CarDescView: View {
    
    var title: String
    var price: String
    var image: String
    
    let stars = ["star.fill", "star.fill", "star.fill", "star.fill", "star"]
    let specTitles = ["Transmission", "Body", "Seats", "Exterior Color", "Interior Color", "Fuel Economy"]
    let specVal = ["8 Speed Automatic", "Sedan", "4", "White", "Daytona Gray Pearl", "18.0/24.0 mpg City/Hwy"]
    @State private var isExpanded = false
    @State private var selectedValue = "Why are my Audi connect services not working?"
    @State private var isExpanded1 = false
    @State private var selectedValue1 = "Where do I find my myAudi PIN and what is it for?"
    @State var isHearted = false
    @State var imgScale: CGFloat = 1.0
    
    let faqAns = ["Audi connect is a subscription based services. If you experience an outage with your services first confirm that your subscription is up to date by logging into your account on www.myaudiconnect.com. If assistance is required accessing this account you may reach our billing and subscription team at + 1 877 505 2834, prompt 1. If you confirm the subscription is active but services are still not working there are several troubleshooting steps which may correct the issue and resume services. Please consult your owner’s manual for direction, or if further assistance is needed you may reach our Audi Customer Experience Center at + 1 800 822 2834.", "Your myAudi PIN is used to link your vehicle with your myAudi account. The PIN is found inside your online myAudi account or MMI Connect app. With successful entry of the myAudi PIN you will be able to use features like sending destinations to the vehicle and personalize certain myAudi services (if applicable)."]
    
    //    init() {
    //        UIScrollView.appearance().bounces = false
    //    }
    
    var body: some View {
        
        ScrollView{
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            ForEach(0..<stars.count){
                                index in
                                Image(systemName: stars[index])
                                    .resizable()
                                    .frame(width: 20, height: 20)
                                    .scaledToFill()
                            }
                        })
                        Text("987 Ratings")
                    })
                    .padding()
                    .padding(.leading, 6)
                    Spacer()
                    Button(action: {
                        isHearted.toggle()
                    }, label: {
                        Image(systemName: isHearted ? "heart.fill" : "heart")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .scaledToFill()
                            .padding(.trailing, 30)
                            .padding(.top, -18)
                    })
                    .foregroundColor(Color(.label))
                })
                
                Image(image)
                    .resizable()
                    .frame(width: 350, height: 250)
                    .scaledToFill()
                    .cornerRadius(6)
                    .shadow(radius: 5 )
                    .scaleEffect(self.imgScale)
                    .gesture(MagnificationGesture().onChanged({
                        val in
                        self.imgScale = val.magnitude
                    }).onEnded({ (scaleFinal) in
                        self.imgScale = scaleFinal.magnitude
                    }))
                
                Text(price)
                    .font(.system(size: 25))
                    .bold()
                
                
                // Image and Specs
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content:{
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("wheel1")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center).padding(.top)
                            Text("Alloy Wheels").padding(.top)
                        })
                        HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("mirror")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center).padding(.top)
                            Text("Power Mirrors").padding(.top)
                        })
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("wheelDrive")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center)
                                .padding(.top)
                                .padding(.leading, -15)
                            Text("4WD/AWD").padding(.top)
                        })
                    })
                    .padding(.trailing)
                    VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content:{
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("lock")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center).padding(.top)
                            Text("Power Locks").padding(.top)
                        })
                        HStack(alignment: .center, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("Froster")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center).padding(.top)
                            Text("Rear Defroster").padding(.top)
                        })
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Image("window")
                                .resizable()
                                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                .frame(width: 50, height: 50, alignment: .center).padding(.top)
                            Text("Power Windows").padding(.top)
                        })
                    })
                    
                })
                
                // Specs
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        ForEach(0..<specTitles.count){
                            index in
                            Text(specTitles[index])
                                .font(.system(size: 19))
                                .padding(.bottom, 3)
                        }
                    }).padding(.leading, 10)
                    Spacer()
                    VStack(alignment: .trailing, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                        ForEach(0..<specVal.count){
                            index in
                            Text(specVal[index])
                                .font(.system(size: 19))
                                .padding(.bottom, 3)
                        }
                    })
                    .padding(.trailing, 10)
                })
                .padding()
                .padding(.top, 10)
                
                // FAQ Dropdown
                
                HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    Text("FAQ's:")
                        .font(.system(size: 25))
                        .bold()
                    Spacer()
                })
                .padding(.leading, 30)
                
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    DisclosureGroup("\(selectedValue1)", isExpanded: $isExpanded1){
                        Divider()
                            .padding(.top, 10)
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                            Text(faqAns[1])
                                .font(.system(size: 18))
                                .padding(.top, 10)
                        })
                    }
                    .padding(10)
                    .background(Color(.systemGray5))
                    .border(Color.black, width: 0.5)
                    .cornerRadius(2)
                    .padding(.horizontal, 25)
                })
                
                
                // 2nd Dropdown
                VStack(alignment: .leading, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                    DisclosureGroup("\(selectedValue)", isExpanded: $isExpanded){
                        Divider()
                            .padding(.top, 10)
                        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                                Text(faqAns[0])
                                    .font(.system(size: 18))
                                    .padding(.top, 10)
                        })
                    }
                    .padding(10)
                    .background(Color(.systemGray5))
                    .border(Color.black, width: 0.5)
                    .cornerRadius(2)
                    .padding(.horizontal, 25)
                })
            })
        }
        
        .navigationBarTitle(Text(title)
                                .font(.system(size: 20)))
        
    }
}

struct CarDescView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            CarDescView(title: "2021 Audi A3 Premium", price: "$55,000", image: "a1")
        }
    }
}
