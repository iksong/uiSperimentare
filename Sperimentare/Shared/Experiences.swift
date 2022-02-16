//
//  Experiences.swift
//  Sperimentare (iOS)
//
//  Created by IK on 2/16/22.
//

import SwiftUI

struct Experience: View {
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("himalaya")
                .resizable()
                .frame(width: 360, height: 500, alignment: .top)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("Things to do \non your trip")
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.orange)
                    .font(.system(size: 36, weight: .bold))
                Button {
                    print("Experience clicked")
                } label: {
                    Text("Experiences")
                        .font(.system(size: 18))
                        .padding()
                        .foregroundColor(.black)
                        .background(RoundedRectangle(cornerRadius: 15).fill(.white))
                }
            }
            .padding([.top, .leading], 15)
        }.cornerRadius(15)
    }
}
