//
//  Support.swift
//  Sperimentare (iOS)
//
//  Created by IK on 2/17/22.
//

import SwiftUI

struct SupportItem: Identifiable {
    let id: UUID = UUID()
    let title: String
    let subTitle: String
}

struct SupportSection: Identifiable {
    let id: UUID = UUID()
    let name: String
    let items: [SupportItem]
}

extension SupportSection {
    static var support: SupportSection {
        let items = [
            SupportItem(title: "Help Center", subTitle: "Get support"),
            SupportItem(title: "Cancellation options", subTitle: "Learn what's covered"),
            SupportItem(title: "Our COVID-19 response", subTitle: "Health and saftey updates")
        ]
        return SupportSection(name: "Support", items: items)
    }
    
    static var hosting: SupportSection {
        let items = [
            SupportItem(title: "Explore hosting resources", subTitle: "All the best tips and tricks"),
            SupportItem(title: "Cover", subTitle: "Protection for Hosts"),
            SupportItem(title: "Support Afghan refugees", subTitle: "Learn how to help")
        ]
        return SupportSection(name: "Hosting", items: items)
    }
    
    static var about: SupportSection {
        let items = [
            SupportItem(title: "Newsroom", subTitle: "Latest announcement"),
            SupportItem(title: "Winter Release", subTitle: "Learn about new features")
        ]
        return SupportSection(name: "About", items: items)
    }
    
    static var allSections: [SupportSection] {
        [SupportSection.support, SupportSection.hosting, SupportSection.about]
    }
}

struct SupportCell: View {
    let title: String
    let subTitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Divider()
                .frame(height: 0.3)
                .background(.gray.opacity(0.01))
                .offset(x: 0, y: -12)
            Text(title)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black.opacity(0.7))
            Text(subTitle)
                .font(.system(size: 16))
                .foregroundColor(.black.opacity(0.5))
        }
        .frame(height: 80)
    }
}

struct SupportDetail: View {
    let item: SupportItem
    
    var body: some View {
        VStack(spacing: 40) {
            Text(item.title)
                .font(.system(size: 36, weight: .bold))
                .foregroundColor(Color.random)
            Text(item.title)
                .font(.system(size: 20))
                .foregroundColor(Color.random)
        }
    }
}

struct SupportHeadCell: View {
    let section: SupportSection
    var body: some View {
        VStack(alignment: .leading) {
            Text(section.name)
                .frame(height: 60)
                .font(.system(size: 18))
                .foregroundColor(.black.opacity(0.8))
            ForEach(section.items) { item in
                NavigationLink {
                    SupportDetail(item: item)
                } label: {
                    SupportCell(title: item.title, subTitle: item.subTitle)
                }
            }
        }
    }
}


struct SupportGrid: View {
    let items: [SupportSection]
    let rows: [GridItem] = [GridItem(.fixed(100))]
                                     
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .top, spacing: 0) {
                ForEach(items) { item in
                    VStack(alignment: .leading) {
                        SupportHeadCell(section: item)
                            .offset(x: 15, y: 0)
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width*0.8, height: 340)
                    .background(.white)
                }
            }
        }
    }
}
