//
//  ContentView.swift
//  Shared
//
//  Created by IK on 2/15/22.
//

import SwiftUI

struct ContentView: View {
    @State var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack {
                WhereToSearchBar(searchText: $searchText)
                NotSureView()
            }
        }
        .background(Color.yellow)
    }
}

struct PlaceHolder<T: View>: ViewModifier {
    var placeHolder: T
    var show: Bool
    func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if show { placeHolder }
            content
        }
    }
}

extension View {
    func placeHolder<T: View>(_ holder: T, show: Bool) -> some View {
        self.modifier(PlaceHolder(placeHolder: holder, show: show))
    }
}

struct WhereToSearchBar: View {
    @Binding var searchText: String
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
            HStack(alignment: .center) {
                Spacer(minLength: 30)
                Image(systemName: "magnifyingglass")
                    .foregroundColor(Color.pink)
                TextField("", text: $searchText) { _ in
                    print("Search - editing")
                } onCommit: {
                    print("Search - done")
                }
                .font(.headline)
                .foregroundColor(.gray)
                .placeHolder(placeHolderText, show: searchText.isEmpty)
            }
        }
        .frame(height: 60)
        .cornerRadius(25)
        .padding()
    }
    
    var placeHolderText: some View {
        Text("Where are you going?")
            .font(.headline)
            .foregroundColor(.black)
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
                        .foregroundColor(.teal)
                        .frame(width: 150, height: 80, alignment: .center)
                        .background(.white)
                        .cornerRadius(60)
                }
            }
        }
        .frame(maxWidth: .infinity, idealHeight: 400, maxHeight: 400, alignment: .center)
    }
}
