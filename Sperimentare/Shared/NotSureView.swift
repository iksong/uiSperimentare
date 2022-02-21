//
//  NotSureView.swift
//  Sperimentare (iOS)
//
//  Created by IK on 2/16/22.
//

import SwiftUI

struct NotSureView: View {
    var body: some View {
        ZStack {
            Image("paris")
                .resizable()
            VStack(spacing: 20) {
                Text("Not sure where to go? \nPerfect.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .font(.system(size: 30, weight: .bold))
                    .padding(.top, 80)
                Button {
                    print("flexible clicked")
                } label: {
                    Text("I'm flexible")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(.white)
                        .cornerRadius(35)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [.red, .blue, .green, .yellow],
                                startPoint: .leading,
                                endPoint: .trailing
                            )
                        )
                }
            }
        }
        .frame(maxWidth: .infinity, idealHeight: 400, maxHeight: 400, alignment: .center)
    }
}
