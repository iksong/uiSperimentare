//
//  ContentView.swift
//  Shared
//
//  Created by IK on 2/15/22.
//

import SwiftUI

// test - workflow

struct ContentView: View {
    @State var searchText = ""
    
    let items = InspireItem.allItems()
    let supportSections = SupportSection.allSections
    
    var body: some View {
        ScrollView {
            VStack {
                WhereToSearchBar(searchText: $searchText)
                NotSureView()
                HeaderView(title: "Inspiration for your \nnext trip")
                    .offset(x: -50, y: 0)
                InspirationGrid(items: items)
                    .padding(.bottom, 50)
                HeaderView(title: "Discover Experiences")
                    .offset(x: -40, y: 0)
                Experience()
                SupportGrid(items: supportSections)
            }
        }
        .background(Color.yellow)
    }
}
