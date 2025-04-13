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
    private var cancellables = Set<AnyCancellable>()

    func fetchPageDetails() {
        APIClient.shared.request(GetPageDetailsRequest())
            .sink { completion in
                if case let .failure(error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { page in
                self.page = page
            }
            .store(in: &cancellables)
    }
}
