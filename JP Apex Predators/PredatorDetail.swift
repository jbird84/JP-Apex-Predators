//
//  PredatorDetail.swift
//  JP Apex Predators
//
//  Created by Kinney Kare on 6/27/24.
//

import SwiftUI

struct PredatorDetail: View {
    
    
    let predator: ApexPredator
    
    var body: some View {
        GeometryReader { geo in
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(predator.type.rawValue)
                    .resizable()
                    .scaledToFit()
                Image(predator.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: geo.size.width/1.5, height: geo.size.height/3)
                    .scaleEffect(x: -1)
                    .shadow(color: .black, radius: 7)
                    .offset(y: 20)
            }
            //Dino Name
            //Current Location
            //Apprears in
            //Movie moments
            //Link to web page
        }
        .ignoresSafeArea()
    }
    }
}

#Preview {
    PredatorDetail(predator: Predators().apexPredators[2])
      //  .preferredColorScheme(.dark)
}
