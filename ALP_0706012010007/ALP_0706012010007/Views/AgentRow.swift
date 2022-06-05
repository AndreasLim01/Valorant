//
//  AgentRow.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 26/05/22.
//

import SwiftUI

struct AgentRow: View {
    @State var agent: Agent
    
    
    var body: some View {
        HStack {
            Image(uiImage: agent.displayIconSmall.load())
                .resizable()
                .frame(width: 50, height: 50)
            Text(agent.displayName)

            Spacer()
            
            Image(uiImage: (agent.role?.displayIcon.load()) ?? UIImage())
                .resizable()
                .frame(width: 20, height: 20)
                .background(.red)
                .cornerRadius(20)
//                .shadow(radius: 1)
            Text(agent.role?.displayName.rawValue ?? "")
                .font(.caption2)
                .padding()

        }
    }
}

extension String {
    func load() -> UIImage {
        
        do {
            guard let url = URL(string: self) else{
                return UIImage()
            }

            let data: Data = try
                Data(contentsOf: url)

            return UIImage(data: data)
                ?? UIImage()


        } catch{

        }
        return UIImage()
    }
}

struct AgentRow_Previews: PreviewProvider {
    static var agents = AgentData().agents
    
    static var previews: some View {
        Group {
            AgentRow(agent: agents[0])
            AgentRow(agent: agents[1])
        }
        .background(.white)
        .previewLayout(.fixed(width: 320, height: 70))
        .environmentObject(AgentData())
        }
}
