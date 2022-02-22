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
    @State var didScroll = false
    
    var searchBackgroundColor: Color {
        return didScroll ? .white : .clear
    }
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                ScrollView {
                    GeometryReader { geometry in
                                    Color.clear.preference(
                                        key: ScrollOffsetPreferenceKey.self,
                                        value: geometry.frame(in: .named("scrollView")).origin
                                    )
                                }.frame(width: 0, height: 0)
                    
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
                .offset(x: 0, y: -60)
                .coordinateSpace(name: "scrollView")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self, perform: offsetChanged)
                
                WhereToSearchBar(searchText: $searchText, didScroll: $didScroll)
                    .background(searchBackgroundColor)
            }
            .background(.white)
            .navigationBarHidden(true)
        }
    }
    
    func offsetChanged(_ offset: CGPoint) {
        if offset.y < -80 {
            didScroll = true
        } else {
            didScroll = false
        }
    }
}


struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGPoint = .zero
    
    static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
