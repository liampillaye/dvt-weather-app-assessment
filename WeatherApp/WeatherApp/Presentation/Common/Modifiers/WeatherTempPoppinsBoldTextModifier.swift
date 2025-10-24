//
//  WeatherTempPoppinsBoldTextModifier.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct WeatherTempPoppinsBoldTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-Bold", size: CGFloat(Float(36))))
            .kerning(0)
            .lineSpacing(44)
            .foregroundStyle(.black)
    }
}

extension View {
    func weatherTempPoppinsBoldStyle() -> some View {
        self.modifier(WeatherTempPoppinsBoldTextModifier())
    }
}
