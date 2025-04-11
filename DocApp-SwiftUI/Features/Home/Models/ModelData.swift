    //
    //  ModelData.swift
    //  DocApp-SwiftUI
    //
    //  Created by Majlinda on 11.4.25.
    //

    import Foundation

    @Observable
class ModelData {
        var pages: Page = load("data.json")
        
        var pageItems: [SectionItem] {
             pages.items.filter { $0.type == "page" }
         }
    }

    func load<T: Decodable>(_ filename: String) -> T {
        let data: Data


        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }


        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }


        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
