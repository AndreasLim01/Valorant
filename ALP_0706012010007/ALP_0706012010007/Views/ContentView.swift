//
//  ContentView.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 23/05/22.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    
    @StateObject var agentData = AgentData()
    
    @State private var selection: Tab = .featured

    enum Tab {
        case featured
        case list
    }

    var body: some View {
        TabView(selection: $selection) {
            Home()
                .tabItem {
                    Label("Agent", systemImage: "list.bullet")
                }
                .tag(Tab.featured)
                .environmentObject(agentData)

            Profile()
                .tabItem {
                    Label("Profile", systemImage: "star")
                }
                .tag(Tab.list)
        }
        .accentColor(.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(AgentData())
            .previewInterfaceOrientation(.portrait)
    }
}
