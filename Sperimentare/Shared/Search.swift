//
//  Search.swift
//  Sperimentare
//
//  Created by IK on 2/15/22.
//

import SwiftUI

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
