//
//  ContentView.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            ProfileBanner()
                .ignoresSafeArea(edges: .top)
                .frame(height: 150)

            CircleImage()
                .offset(y: -90)
                .padding(.bottom, -90)
            
            Text("Username")
                .font(.title)

            VStack(alignment: .leading) {
                Text("ACCOUNT INFORMATION")
                    .font(.title2)

                HStack {
                    Spacer()
                    Text("Kills")
                        .font(.headline)
                    Text("121")
                        .font(.subheadline .weight(.light))
                    Text("Deaths")
                        .font(.headline)
                    Text("78")
                        .font(.subheadline .weight(.light))
                    Text("Assists")
                            .font(.headline)
                    Text("192")
                        .font(.subheadline .weight(.light))
                    Spacer()
                }
                .padding(2)
                HStack {
                    Spacer()
                    VStack(){
                        Text("Current Rank")
                            .font(.headline)
                        Image("Rank")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Platinum III")
                            .font(.subheadline .weight(.light))
                    }
                    Spacer()
                    Spacer()
                    Spacer()
                    VStack(){
                        Text("Highest Rank")
                            .font(.headline)
                        Image("Rank")
                            .resizable()
                            .frame(width: 30, height: 30)
                        Text("Platinum III")
                            .font(.subheadline .weight(.light))
                    }
                    
                    Spacer()
                }
                .padding(15)
                HStack {
                    Text("CAREER")
                        .font(.title2)
                    Spacer()
                }
                .padding(.top, 80)
                HStack {
                    
                }
            }
            .padding()
            
            
            
            
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
