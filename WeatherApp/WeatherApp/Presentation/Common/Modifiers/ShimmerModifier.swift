//
//  ShimmerModifier.swift
//  WeatherApp
//
//  Created by Liam Pillaye.
//

import SwiftUI

struct ShimmerModifier: ViewModifier {
    @State private var phase: CGFloat = 0
    let duration: Double = 1.5

    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(gradient: Gradient(colors: [.gray.opacity(0.3), .white, .gray.opacity(0.3)]),
                               startPoint: .init(x: phase - 1, y: 0),
                               endPoint: .init(x: phase + 1, y: 0))
                .mask(content)
            )
            .onAppear {
                withAnimation(.linear(duration: duration).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

extension View {
    func shimmering() -> some View {
        modifier(ShimmerModifier())
    }
}
