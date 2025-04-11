//
//  AllPages.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//
import SwiftUI

struct AllPagesView: View {
    var body: some View {
        VStack() {
            CustomNavigationBar()
            AllPagesList()
        }
        .edgesIgnoringSafeArea(.top)
    }
}



#Preview {
    AllPagesView().environment(ModelData())
}
