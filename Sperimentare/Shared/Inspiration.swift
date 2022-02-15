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
        }
    }
}

struct HeaderView: View {
    let title: String
    
    var body: some View {
        Text(title)
            .font(.system(size: 30, weight: .bold))
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
            InspireItem(color: .green, title: "Broken", subTitle: "157 miles away", imageName: "circle.grid.cross.left.filled"),
            InspireItem(color: .purple, title: "Galveston", subTitle: "280 miles away", imageName: "externaldrive.connected.to.line.below.fill"),
            InspireItem(color: .red, title: "Santa Fe", subTitle: "970 miles away", imageName: "l.joystick.tilt.up")
        ]
    }
}

struct Inspiration: View {
    let item: InspireItem
    var body: some View {
        ZStack {
            VStack {
                Image(systemName: item.imageName)
                    .frame(width: 150, height: 150)
                    .background(.white)
                Text(item.title)
                    .font(.largeTitle)
                Text(item.subTitle)
                    .font(.headline)
            }
        }
        .background(item.color)
        .frame(height: 300)
    }
}
