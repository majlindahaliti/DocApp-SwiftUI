//
//  AllPagesList.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct AllPagesList: View {
    @Environment(ModelData.self) var modelData
    
     var body: some View {
             List(modelData.pageItems, id: \.self) { item in
                 PageRow(page: item)
             }
             .navigationBarHidden(true)
             .listStyle(PlainListStyle())
     }
}


#Preview {
    AllPagesList().environment(ModelData())
}
