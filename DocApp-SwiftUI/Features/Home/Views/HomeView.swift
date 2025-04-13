//
//  Home.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 10.4.25.
//


import SwiftUI

struct HomeView: View {
    @State private var path = NavigationPath()
    @StateObject private var homeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationStack(path: $path) {
            ZStack {
                Color.main
                    .ignoresSafeArea()
                VStack {
                    SearchBarView(text: $homeViewModel.searchText).padding()
                    ZStack(alignment: .top) {
                        Color.white
                            .roundedCorner(30, corners: [.topLeft, .topRight])
                            .ignoresSafeArea(edges: [.bottom])
                        HStack {
                            if let title = homeViewModel.page?.title {
                                Text(title).font(Fonts.poppinsMedium(size: 20))
                            }
                            
                            Spacer()
                            
                            Button("All pages") {
                                path.append(homeViewModel.allPageItems)
                            }.font(Fonts.poppinsRegular(size: 14))
                        }
                        .padding()
                        ScrollView {
                            if homeViewModel.filteredSections.isEmpty {
                                VStack {
                                    Spacer()
                                    Text("No Data")
                                        .font(Fonts.poppinsRegular(size: 16))
                                        .foregroundColor(.black)
                                    Text("No results found")
                                        .font(Fonts.poppinsRegular(size: 14))
                                        .foregroundColor(.gray)
                                    Spacer()
                                }
                                .padding(.top, 150)
                            } else {
                                VStack(spacing: 0) {
                                    ForEach(homeViewModel.filteredSections, id: \.title) { section in
                                        if let sectionItems = section.items, !sectionItems.isEmpty {
                                            ExpandableCell(row: 0, section: section) { selectedSection in
                                                path.append(selectedSection)
                                            }
                                            .padding(.horizontal)
                                        }
                                    }
                                }
                            }
                        }
                        .padding(.top, 60)
                        .navigationBarTitleDisplayMode(.inline)
                    }
                }
            }
            .onAppear {
                homeViewModel.fetchPageDetails()
            }
            .navigationDestination(for: SectionItem.self) { section in
                PageDetails(section: section)
            }
            .navigationDestination(for: [SectionItem].self) { filteredPages in
                AllPagesView(filteredPages: filteredPages)
            }
        }
    }
}

#Preview {
    HomeView()
}

