//
//  CareerCard.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 04/06/22.
//

import SwiftUI


struct CareerCard: View {
    var status: String
    
    var body: some View {
        ZStack{
            Image(status)
                .resizable()
                .scaledToFit()
        }
    }
}

struct CareerCard_Previews: PreviewProvider {
    static var previews: some View {
        CareerCard(status: "victory")
            .previewLayout(.fixed(width: 300, height: 150))
    }
}
