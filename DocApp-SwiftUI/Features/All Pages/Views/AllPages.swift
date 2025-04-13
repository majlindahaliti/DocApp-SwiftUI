//
//  AllPages.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//
import SwiftUI

struct AllPagesView: View {
    let filteredPages: [SectionItem]
    
    var body: some View {
        VStack() {
            CustomNavigationBar()
            AllPagesList(filteredPages: filteredPages)
        }
        .edgesIgnoringSafeArea(.top)
    }
}



#Preview {
    AllPagesView(filteredPages: ModelData().pageItems)
}
