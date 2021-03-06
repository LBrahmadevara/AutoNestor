//
//  ImageView.swift
//  AutoNestor
//
//  Created by Likhitha Brahmadevara on 4/27/21.
//

import SwiftUI

struct ImageView: View {@State var scale: CGFloat = 1.0
    @State var isTapped: Bool = false
    @State var pointTapped: CGPoint = CGPoint.zero
    @State var draggedSize: CGSize = CGSize.zero
    @State var previousDragged: CGSize = CGSize.zero
    var body: some View {
        GeometryReader { reader in
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
                Spacer()
                Image("a2")
                    .resizable()
                    .scaledToFit()
                    .animation(.default)
                    .offset(x: self.draggedSize.width, y: self.draggedSize.height)
                    .scaleEffect(self.scale)
                    .scaleEffect(self.isTapped ? 2 : 1, anchor: UnitPoint(x: self.pointTapped.x / reader.frame(in: .global).maxX, y: self.pointTapped.y / reader.frame(in: .global).maxY))
                    .gesture(TapGesture(count: 2).onEnded({
                        self.isTapped.toggle()
                    })
                    .simultaneously(with: DragGesture(minimumDistance: 0, coordinateSpace: .global)
                                        .onChanged({ value in
                                            self.pointTapped = value.startLocation
                                            self.draggedSize = CGSize(width: value.translation.width + self.previousDragged.width, height: value.translation.height + self.previousDragged.height)
                                            print(value.startLocation)
                                        })
                                        .onEnded({ value in
                                            let offsetWidth = (reader.frame(in: .global).maxX * self.scale - reader.frame(in: .global).maxX) / 2
                                            let newDraggedWidth = self.draggedSize.width * self.scale
                                            if (newDraggedWidth > offsetWidth){
                                                self.draggedSize = CGSize(width: offsetWidth / self.scale, height: value.translation.height + self.previousDragged.height)
                                            }else if (newDraggedWidth < -offsetWidth){
                                                self.draggedSize = CGSize(width: -offsetWidth / self.scale, height: value.translation.height + self.previousDragged.height)
                                            }else{
                                                self.draggedSize = CGSize(width: value.translation.width + self.previousDragged.width, height: value.translation.height + self.previousDragged.height)
                                            }
                                            self.previousDragged = self.draggedSize
                                            print(value.location)
                                        })))
                    .gesture(MagnificationGesture().onChanged({ scale in
                        self.scale = scale.magnitude
                    }).onEnded({ scaleFinal in
                        self.scale = scaleFinal.magnitude
                    }))
                Spacer()
            })
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
