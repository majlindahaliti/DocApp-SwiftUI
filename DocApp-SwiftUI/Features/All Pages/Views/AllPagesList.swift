//
//  AllPagesList.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct AllPagesList: View {
    let filteredPages: [SectionItem]
    
    var body: some View {
        List(filteredPages, id: \.self) { item in
            PageRow(page: item)
        }
        .navigationBarHidden(true)
        .listStyle(PlainListStyle())
    }
}


#Preview {
    AllPagesList(filteredPages: ModelData().pageItems)
}
