//
//  CustomNavigationBar.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//

import SwiftUI

struct CustomNavigationBar: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Button(action: {
                    dismiss()
                }) {
                    Image("back_icon")
                        .padding(.horizontal, 10)
                }
                
                Text("All Pages")
                    .font(.title3)
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                
                Spacer()
            }
            .padding(.leading, 15)
            .padding(.bottom, 30)
        }
        .frame(height: 120)
        .background(Color.mainColor)
        .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
    }
}

#Preview {
    CustomNavigationBar()
}

