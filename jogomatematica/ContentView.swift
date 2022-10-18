//
//  ContentView.swift
//  jogomatematica
//
//  Created by Natália Pessoa de Azevedo Albuquerque on 18/10/22.
//

import SwiftUI

struct ContentView: View {
    @State private var offset = CGSize.zero
    @State private var dragOffSet = CGSize.zero
    @State var scale: CGFloat = 1
    var body: some View {
        VStack{
            Spacer()
            Image("crab")
                .resizable()
                .padding()
                .frame(width: 164.71, height: 100.0)
                
                .scaledToFit()
                .offset(x: offset.width + dragOffSet.width)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            self.dragOffSet = value.translation
                        }
                        .onEnded{_ in
                            self.offset.width += self.dragOffSet.width
                            self.dragOffSet = .zero
                        }
                    
                )
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
