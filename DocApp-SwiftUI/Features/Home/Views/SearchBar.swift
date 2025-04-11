//
//  SearchBar.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search...", text: $text).padding()
                .frame(height: 46)
                .background(Color(.white))
                .cornerRadius(23)
        }
    }
}
