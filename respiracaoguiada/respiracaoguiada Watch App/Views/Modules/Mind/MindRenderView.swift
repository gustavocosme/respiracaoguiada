//
//  MindRenderView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 06/07/25.
//

import SwiftUI

struct MindRenderView: View {
    
    @ObservedObject var menuData: MenuData

    var body: some View {
        
        switch menuData.section {
        case .spirit:
            BreathingAnimationView()
        case .breathe:
            BreathingTriangleView()
        case .reflect:
            BreathingSquareFlowerView()
        }
    }
}

#Preview {
    MindRenderView(menuData: MenuData(section: .spirit))
}
