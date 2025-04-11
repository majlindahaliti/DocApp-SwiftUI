//
//  PageRow.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct PageRow: View {
    var page: SectionItem
    
    var body: some View {
        HStack {
            Text(page.title)
            Spacer()
            Image("next_icon").frame(width: 15, height: 15)
        }
        .padding(20)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    var pages = ModelData().pageItems
    Group{
        PageRow(page: pages[0])
        PageRow(page: pages[0])
    }
}
