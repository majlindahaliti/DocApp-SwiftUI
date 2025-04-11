//
//  SwiftUIView.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct ExpandableCell: View {
    @State private var tapped: Bool = false
    var row: Int
    var section: SectionItem

    var body: some View {
        VStack(spacing: 0) {
            Text(section.title)
                .font(.headline)
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        tapped.toggle()
                    }
                }

            // If tapped, show nested items (subsections or sub-subsections)
            if tapped {
                VStack(spacing: 0) {
                    // Handle the next level of nested items (subsections)
                    if let subsections = section.items {
                        ForEach(subsections, id: \.title) { subsection in
                            ExpandableCell(row: 0, section: subsection)
                                .padding(.leading, 20)  // Indent subsections
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ExpandableCell(row: 0, section: SectionItem(type: "page", title: "Test", items: [SectionItem(type: "section", title: "Test")]))
}
