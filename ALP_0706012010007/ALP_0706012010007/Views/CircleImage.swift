//
//  CircleImage.swift
//  ALP_0706012010007
//
//  Created by MacBook Pro on 23/05/22.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        Image("Sage_artwork")
            .resizable()
            .frame(width: 100, height: 130)
            .padding()
            .aspectRatio(contentMode: .fit)
            .background(.white)
            .clipShape(Circle())
//            .overlay {
//                Circle().stroke(.white, lineWidth: 4)
//            }
            .shadow(radius: 7)
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
