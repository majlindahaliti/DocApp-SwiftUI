//
//  DocApp_SwiftUIApp.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 10.4.25.
//

import SwiftUI

@main
struct DocApp_SwiftUIApp: App {
    @State private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environment(modelData)
        }
    }
}
