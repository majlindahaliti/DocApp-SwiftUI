//
//  PageDetails.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 12.4.25.
//

import SwiftUI
import Kingfisher

struct PageDetails: View {
    var section: SectionItem
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                if let imgUrl = section.src{
                    KFImage(URL(string: imgUrl))
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 2)
                }
                else{
                    Image("coverImg")
                        .resizable()
                        .scaledToFill()
                        .frame(width: UIScreen.main.bounds.width, height: 300)
                        .roundedCorner(30, corners: [.bottomLeft, .bottomRight])
                        .clipped()
                        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 2)
                }
                
                Text(section.title)
                    .font(Fonts.poppinsMedium(size: 20))
                    .padding()
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
        }
        .ignoresSafeArea(edges: .top)
        .background(Color.white)
    }
}

#Preview {
    PageDetails(section: SectionItem(type: "page", title: "Test Title", items: [
        SectionItem(type: "image", title: "Sample Image", src: "https://robohash.org/280?&set=set4&size=400x400")
    ]))
}
