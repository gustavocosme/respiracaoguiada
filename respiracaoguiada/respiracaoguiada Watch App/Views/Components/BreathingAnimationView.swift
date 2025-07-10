//
//  BreathingAnimationView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 07/07/25.
//

import SwiftUI

struct BreathingAnimationView: View {

    @State private var isAnimating = false
    private let petalCount = 12
    @StateObject private var hapticManager = HapticManager()

    var body: some View {
        ZStack {
            
            VStack {
                
                Spacer()

                Text(isAnimating ? "Inspire" : "Expire")
                    .font(.caption2)
            }
            
            ZStack {
                ForEach(0..<petalCount, id: \.self) { i in
                    Circle()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.cyan.opacity(0.8), Color.blue.opacity(0.6)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 120, height: 120, alignment: .center)
                        .offset(y: isAnimating ? -100 : -50)
                        .rotationEffect(.degrees(Double(i) * (360.0 / Double(self.petalCount))))
                        .blur(radius: isAnimating ? 0 : 16)
                }
            }
            .scaleEffect(isAnimating ? 0.4 : 0.05)
            .rotationEffect(.degrees(isAnimating ? 60 : 0))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    self.hapticManager.start()
                    self.isAnimating = true
                }
            }.onDisappear {
                self.hapticManager.stop()
            }
        }
    }
}

#Preview {
    BreathingAnimationView()
}
