//
//  HeadingBoldTextModifier.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct HeadingPoppinsBoldTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-Bold", size: CGFloat(Float(18))))
            .kerning(0)
            .lineSpacing(28)
            .foregroundStyle(.white)
    }
}

extension View {
    func headingPoppinsBoldStyle() -> some View {
        self.modifier(HeadingPoppinsBoldTextModifier())
    }
}

