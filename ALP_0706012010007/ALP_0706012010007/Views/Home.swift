//
//  Home.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import SwiftUI

struct Home: View {
    var body: some View {
        VStack(){
            VStack() {
                HStack(){
                    Text("TRENDING NOW")
                    .font(.title2)
                    Spacer()
                }
                .padding()
                
                HStack {
                    Spacer()
                    Image("Frame1")
                        .resizable()
                        .frame(width: 280, height: 150)
                    Image("Frame2")
                        .resizable()
                        .frame(width: 280, height: 150)
                }
                .padding(.leading, 180)
                .frame(width: 430, height: 150)
                .clipped()
                
                HStack(){
                    Text("AGENT")
                    .font(.title2)
                    Spacer()
                }
                .padding()
                
                List(agents, id: \.uuid) { agent in
                    AgentRow(agent: agent)
                }
                
//                NavigationView {
//                    List(agents, id: \.uuid) { agent in
//                        NavigationLink {
//                            AgentDetail()
//                        } label: {
//                            AgentRow(agent: agent)
//                        }
//                    }
//                    .navigationTitle("Agent").font(.title3)
//                }
            }
            Spacer()
        }
        .background(.white)
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
