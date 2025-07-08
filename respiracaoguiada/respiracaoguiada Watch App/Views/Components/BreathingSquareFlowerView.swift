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
            
            VStack {
                
                Spacer()

                Text(isAnimating ? "Inspire" : "Expire")
                    .font(.footnote)
            }
            
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
                        .frame(width: 80, height: 80)
                        .offset(y: isAnimating ? -100 : -60)
                        .rotationEffect(.degrees(Double(i) * (360.0 / Double(squareCount))))
                        .blur(radius: isAnimating ? 0.0 : 10.0)
                        .opacity(isAnimating ? 1.0 : 0.1)
                }
            }
            .scaleEffect(isAnimating ? 0.4 : 0.1)
            .rotationEffect(.degrees(isAnimating ? 360 : 0))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    self.isAnimating = true
                }
            }
        }
           

    }
}

#Preview {
    BreathingSquareFlowerView()
}
