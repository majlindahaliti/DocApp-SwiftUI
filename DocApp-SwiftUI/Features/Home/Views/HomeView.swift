//
//  Home.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 10.4.25.
//


import SwiftUI

struct HomeView: View {
    @State private var text = ""
    @State private var path = NavigationPath()
    
    @Environment(ModelData.self) var modelData
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    SearchBarView(text: $text).padding(16)
                    ZStack(alignment: .top) {
                        Color.white
                            .roundedCorner(30, corners: [.topLeft, .topRight])
                            .ignoresSafeArea(edges: [.bottom])
                        HStack {
                            Text(modelData.pages.title).font(Fonts.poppinsMedium(size: 20))
                            
                            Spacer()
                            
                            Button("All pages") {
                                path.append("AllPages")
                            }.font(Fonts.poppinsRegular(size: 14))
                        }
                        .padding()
                        ScrollView {
                            VStack(spacing: 0) {
                                ForEach(modelData.pages.items, id: \.title) { section in
                                    if let items = section.items, !items.isEmpty {
                                        ExpandableCell(row: 0, section: section)
                                            .padding(.horizontal)
                                    }
                                }
                            }
                        }
                        .padding(.top, 60)
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .navigationDestination(for: String.self) { value in
                if value == "AllPages" {
                    AllPagesView()
                }
            }
        }
    }
}

#Preview {
    HomeView().environment(ModelData())
}

