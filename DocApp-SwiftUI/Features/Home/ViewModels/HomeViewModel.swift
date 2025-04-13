//
//  HomeViewModel.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import Foundation
import Combine
import Alamofire

class HomeViewModel: ObservableObject {
    @Published var page: Page?
    @Published var errorMessage: String?
    @Published var filteredSections: [SectionItem] = []
    @Published var searchText: String = "" {
        didSet {
            filterSections()
        }
    }
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchPageDetails() {
        APIClient.shared.request(GetPageDetailsRequest())
            .sink { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { [weak self] page in
                self?.page = page
                self?.filteredSections = page.items  // initially show all
            }
            .store(in: &cancellables)
    }
    
    private func filterSections() {
        guard let allSections = page?.items else { return }

        if searchText.isEmpty {
            filteredSections = allSections
        } else {
            filteredSections = allSections.filter { section in
                section.title.lowercased().contains(searchText.lowercased())
            }
        }
    }
    
    var allPageItems: [SectionItem] {
        page?.items.filter { $0.type == "page" } ?? []
    }
}

