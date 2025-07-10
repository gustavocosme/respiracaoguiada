//
//  BreathingTriangleView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 07/07/25.
//

import SwiftUI

struct BreathingTriangleView: View {
    
    @State private var isAnimating = false
    private let triangleCount = 16
    @StateObject private var hapticManager = HapticManager()

    var body: some View {
        
        ZStack {
        
            Color.black.ignoresSafeArea()
            
            VStack {
                
                Spacer()

                Text(isAnimating ? "Inspire" : "Expire")
                    .font(.footnote)
            }
           
            ZStack {
                
                ForEach(0..<triangleCount, id: \.self) { i in
                    
                    Leaf()
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [Color.green.opacity(0.8), Color.teal.opacity(0.6)]),
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        )
                        .frame(width: 100, height: 100)
                        .offset(y: isAnimating ? -100 : -50)
                        .rotationEffect(.degrees(Double(i) * (360.0 / Double(triangleCount))))
                        .blur(radius: isAnimating ? 0 : 8)
                }
            }
            .scaleEffect(isAnimating ? 0.4 : 0.2)
            .rotationEffect(.degrees(isAnimating ? 190 : 0))
            .onAppear {
                withAnimation(Animation.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                    self.isAnimating.toggle()
                    self.hapticManager.start()
                }
            }.onDisappear {
                self.hapticManager.stop()
            }
        }
    }
}

struct Leaf: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let height = rect.height

        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        
        path.addQuadCurve(
            to: CGPoint(x: rect.minX, y: rect.maxY),
            control: CGPoint(x: rect.minX, y: rect.minY + height * 0.5)
        )
        
        path.addQuadCurve(
            to: CGPoint(x: rect.midX, y: rect.minY),
            control: CGPoint(x: rect.maxX, y: rect.minY + height * 0.5)
        )
        
        return path
    }
}

#Preview {
    BreathingTriangleView()
}
