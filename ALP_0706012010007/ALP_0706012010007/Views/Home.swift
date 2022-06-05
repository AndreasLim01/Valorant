//
//  Home.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import SwiftUI

struct Home: View {
    let filters = ["Sentinel", "Duelist", "Controller", "Initiator", "All"]
    
    @State var searchText = ""
    @State private var filter = "All"
    @EnvironmentObject var agentData: AgentData
    
    var searchResults: [Agent] {
        if(searchText.isEmpty){
            return agentData.agents
        }else{
            return agentData.agents.filter{
                $0.displayName.contains(searchText)
            }
        }
    }
    
    var filteredResults: [Agent]{
        var agentList = [Agent]()
        
        if filter == "All"{
            return searchResults
        }else{
            agentList = agentList.filter{
                $0.role?.displayName.rawValue ?? "Unknown" == filter
            }
        }
        
        return agentList
    }
        
    var body: some View {
        VStack(){
            NavigationView {
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
                    
                    HStack {
                        TextField("Search", text: $searchText)
                            .offset(x: 5)
                            .clipShape(Capsule())
                            .padding(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(Color.secondary, lineWidth: 2)
                            )
                            .frame(height: 30)
                            .padding(12)
                        
                        Menu {
                            Picker("Role", selection: $filter) {
                                ForEach(filters, id: \.self) { role in
                                    Text(role)
                                }
                            }
                            .pickerStyle(.inline)

                        } label: {
                            Image(systemName: "slider.horizontal.3")
                                .resizable()
                                .scaledToFit()
                                .foregroundStyle(.red)
                                .frame(height: 30, alignment: .leading)
                                .padding(10)
                        }
                        
                        Spacer()
                    }
                    
                    List (filteredResults, id: \.uuid){
                        agent in
                        NavigationLink {
                            AgentDetail(agent: agent)
                                .frame(width: UIScreen.main.bounds.width, height:UIScreen.main.bounds.height)
                                .ignoresSafeArea()
                        } label: {
                            AgentRow(agent: agent)
                        }
                    }
                    .navigationBarHidden(true)
                }
                .background(.white)
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static let agentData = AgentData()
    
    static var previews: some View {
        Home()
            .environmentObject(agentData)
    }
}
