//
//  Inspiration.swift
//  Sperimentare
//
//  Created by IK on 2/15/22.
//

import SwiftUI


struct InspirationGrid: View {
    let items: [InspireItem]
    let rows: [GridItem] = [GridItem(.fixed(50))]
                                     
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top) {
                ForEach(items) { item in
                    Inspiration(item: item)
                }
            }
            .offset(x: 20, y: 0)
        }
    }
}

struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 26, weight: .bold))
            .multilineTextAlignment(.leading)
            .foregroundColor(Color.black)
    }
}

struct InspireItem: Identifiable {
    let id: UUID = UUID()
    let color: Color
    let title: String
    let subTitle: String
    let imageName: String
}

extension InspireItem {
    static func allItems() -> [InspireItem] {
        return [
            InspireItem(color: Color.random, title: "Broken", subTitle: "157 miles away", imageName: "circle.grid.cross.left.filled"),
            InspireItem(color: Color.random, title: "Galveston", subTitle: "280 miles away", imageName: "externaldrive.connected.to.line.below.fill"),
            InspireItem(color: Color.random, title: "Santa Fe", subTitle: "970 miles away", imageName: "l.joystick.tilt.up")
        ]
    }
}

struct Inspiration: View {
    let item: InspireItem
    var body: some View {
        ZStack {
            VStack(spacing: 15) {
                Image(systemName: item.imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 100)
                    .foregroundColor(.white)
                    .background(.teal)
                VStack(alignment: .leading, spacing: 5) {
                    Text(item.title)
                        .font(.system(size: 24, weight: .bold))
                    Text(item.subTitle)
                        .font(.headline)
                }
                .padding(.leading, 15)
                .frame(width: 200, alignment: .leading)
                Spacer()
            }.frame(height: 250, alignment: .leading)
        }
        .background(item.color)
        .cornerRadius(15)
    }
}
