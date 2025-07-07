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
            Text("spirit")
        case .breathe:
            Text("breathe")
        case .reflect:
            Text("reflect")
        }
    }
}

#Preview {
    MindRenderView(menuData: MenuData(section: .spirit))
}
