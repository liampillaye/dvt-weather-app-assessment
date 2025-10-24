//
//  WeatherTitleCardPoppinsSemiBoldTextModifier 2.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct WeatherTitleCardPoppinsSemiBoldTextModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.custom("Poppins-Bold", size: CGFloat(Float(16))))
            .kerning(0)
            .lineSpacing(24)
            .foregroundStyle(.black)
    }
}

extension View {
    func weatherTitleCardPoppinsSemiBoldStyle() -> some View {
        self.modifier(WeatherTitleCardPoppinsSemiBoldTextModifier())
    }
}
