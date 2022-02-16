//
//  ContentView.swift
//  Shared
//
//  Created by IK on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    let items = InspireItem.allItems()
    
    var body: some View {
        ScrollView {
            VStack {
                WhereToSearchBar(searchText: $searchText)
                NotSureView()
                HeaderView(title: "Inspiration for your \nnext trip")
                    .offset(x: -50, y: 0)
                InspirationGrid(items: items)
            }
        }
        .background(Color.yellow)
    }
}

struct NotSureView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.yellow, .teal], startPoint: .top, endPoint: .bottom)

            VStack(spacing: 40) {
                Text("Not sure where to go? \nPerfect.")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.white)
                    .font(.system(size: 30, weight: .bold))
                
                Button {
                    print("flexible clicked")
                } label: {
                    Text("I'm flexible")
                        .font(.system(size: 24, weight: .bold))
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(.white)
                        .cornerRadius(60)
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
