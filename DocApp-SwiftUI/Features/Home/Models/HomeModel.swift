//
//  HomeModel.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import Foundation

struct SectionItem: Codable, Hashable {
    var type: String
    var title: String
    var items: [SectionItem]?
    var src: String?
}

struct Page: Codable, Hashable {
    var type: String
    var title: String
    var items: [SectionItem]
}
