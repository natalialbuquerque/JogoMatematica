//
//  HomeView.swift
//  jogomatematica
//
//  Created by Raphael on 25/10/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Image("gametitle")
                    .imageScale(.large)
                
                NavigationLink(destination: ContentView()){
                    Image("playbutton")
                        .imageScale(.medium)
                }
                Image("configurationbutton")
                    .imageScale(.medium)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
