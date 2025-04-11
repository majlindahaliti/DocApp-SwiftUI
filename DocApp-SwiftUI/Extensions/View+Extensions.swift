//
//  View+Extensions.swift
//  DocApp-SwiftUI
//
//  Created by Majlinda on 11.4.25.
//
import SwiftUI

extension View {
    func roundedCorner(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
