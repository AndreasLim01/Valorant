//
//  AgentList.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import SwiftUI

struct AgentList: View {
    var agents = AgentData().agents
    
    var body: some View {
        List(agents, id: \.uuid) { agent in
                    AgentRow(agent: agent)
        }
    }
}

struct AgentList_Previews: PreviewProvider {
    static let agentData = AgentData()
    
    static var previews: some View {
        AgentList()
            .environmentObject(agentData)
    }
}
