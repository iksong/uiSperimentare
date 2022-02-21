//
//  Explore.swift
//  Sperimentare (iOS)
//
//  Created by IK on 2/19/22.
//

import SwiftUI

struct Explore: View {
    @State var searchText = ""
    
    let items = InspireItem.allItems()
    let supportSections = SupportSection.allSections
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            ScrollView {
                VStack {
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
            .ignoresSafeArea()
            WhereToSearchBar(searchText: $searchText)
                .background(.clear)
        }
        .background(.white)
    }
}
