//
//  ContentView.swift
//  jogomatematica
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 18/10/22.
//

import SwiftUI

struct ContentView: View {
//    @State private var offset = CGSize.zero
//    @State private var dragOffSet = CGSize.zero
    @State private var rectPosition = CGPoint(x: 50, y: 650)
    @State private var isEnded = false
    @State var scale: CGFloat = 1
    
    var body: some View {
        VStack{
            Spacer()
            Image("crab")
                .resizable()
                .padding()
                .frame(width: 164.71, height: 100.0)
                .scaledToFit()
//                .offset(x: offset.width + dragOffSet.width)
                .position(rectPosition)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            self.rectPosition = CGPoint(x: value.location.x, y: 650)
                        }
                        .onEnded{ value in
                            self.isEnded = value.location.x < 120
                        }
                    
                )
        }
        .padding()
    }
    
    func screenBounds() -> CGFloat {
        let max = UIScreen.main.bounds.width
//        let currentBound = abs(offset.width)
        return  max
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
