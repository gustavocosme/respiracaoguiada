//
//  BreathingSquareFlowerView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 07/07/25.
//

import SwiftUI

struct BreathingSquareFlowerView: View {
    @State private var isAnimating = false
    private let squareCount = 22

    var body: some View {
           
        ZStack {
            
            ForEach(0..<squareCount, id: \.self) { i in
                
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            gradient: Gradient(colors: [
                                Color.cyan.opacity(0.8),
                                Color.purple.opacity(0.3)
                            ]),
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 100, height: 100)
                    .offset(y: isAnimating ? -100 : -60)
                    .rotationEffect(.degrees(Double(i) * (360.0 / Double(squareCount))))
                    .blur(radius: isAnimating ? 0.0 : 10.0)
                    .opacity(isAnimating ? 1.0 : 0.0)
            }
        }
        .scaleEffect(isAnimating ? 0.5 : 0.01)
        .rotationEffect(.degrees(isAnimating ? 360 : 0))
        .animation(.easeInOut(duration: 4).repeatForever(autoreverses: true), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

#Preview {
    BreathingSquareFlowerView()
}
