//
//  ContentView.swift
//  Shared
//
//  Created by IK on 2/15/22.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        TabView {
            Explore()
                .tabItem {
                    Label(TabbarItem.explore.title, systemImage: TabbarItem.explore.imageName)
                }
            Wishlists()
                .tabItem {
                    Label(TabbarItem.wishlists.title, systemImage: TabbarItem.wishlists.imageName)
                }
        }.accentColor(.pink)
    }
}

struct Wishlists: View {
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(0..<20) { _ in
                    Rectangle()
                        .frame(height: 80)
                        .foregroundColor(Color.random)
                        .cornerRadius(15)
                }
            }.navigationTitle(TabbarItem.wishlists.title)
        }
    }
}

extension Color {
    static var random: Color {
        return Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1)
        )
    }
}

enum TabbarItem {
    case explore
    case wishlists
    
    var title: String {
        switch self {
        case .explore:
            return "Explore"
        case .wishlists:
            return "Wishlists"
        }
    }
    
    var imageName: String {
        switch self {
        case .explore:
            return "magnifyingglass"
        case .wishlists:
            return "heart"
        }
    }
}
