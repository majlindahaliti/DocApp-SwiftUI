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
    var onSelect: (SectionItem) -> Void
    var isExpandable: Bool {
        section.items != nil && !section.items!.isEmpty
    }


    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(section.title)
                    .font(fontForLevel(row))
                    .foregroundColor(colorForLevel(row))

                Spacer()

                if isExpandable {
                    Image(systemName: tapped ? "chevron.up" : "chevron.down")
                        .foregroundColor(.gray)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .onTapGesture {
                if isExpandable {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        tapped.toggle()
                    }
                }
                else{
                    //navigate to page details
                    onSelect(section)
                }
            }


            Divider()

            if tapped {
                VStack(spacing: 0) {
                    if let subsections = section.items {
                        ForEach(subsections, id: \.title) { subsection in
                            ExpandableCell(row: row + 1, section: subsection, onSelect: onSelect)
                                .padding(.leading, 20)
                        }
                    }
                }
            }
        }
    }

    func fontForLevel(_ level: Int) -> Font {
        switch level {
        case 0:
            return Fonts.poppinsMedium(size: 16)
        case 1:
            return Fonts.poppinsMedium(size: 14)
        default:
            return Fonts.poppinsRegular(size: 12)
        }
    }

    func colorForLevel(_ level: Int) -> Color {
        switch level {
        case 0:
            return .black
        case 1:
            return .gray
        default:
            return Color(UIColor.lightGray)
        }
    }
}


#Preview {
    ExpandableCell(
        row: 0,
        section: SectionItem(
            type: "page",
            title: "Test"
        ),
        onSelect: { selectedSection in
            print("Selected Section: \(selectedSection.title)")
        }
    )
}

