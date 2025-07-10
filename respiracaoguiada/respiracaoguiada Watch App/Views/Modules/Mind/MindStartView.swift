//
//  MindStartView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI
import WatchKit

struct MindStartView: View {
   
    @Environment(\.dismiss) var dismiss
    @State private var pageIndex = 2
    @ObservedObject var menuData: MenuData

    var body: some View {
        
        ZStack {
            
            LinearGradient(
                gradient: Gradient(colors: [Color.black,
                                            Color.black,
                                            Color.black,
                                            .gray.opacity(0.2)]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()
            
            TabView(selection: $pageIndex) {
                
                Button("Finalizar"){
                    self.dismiss()
                }
                .bold()
                .glassEffect(.regular.tint(.red).interactive())
                .padding(.horizontal, 22)
                    .tag(1)
                
                MindRenderView(menuData: menuData)
                .tag(2)
                
                MindTimerView(minutes: menuData.timer, onComplete: {
                    self.dismiss()
                })
                
                NowPlayingView()
            }
        }
        .tabViewStyle(.carousel)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MindStartView(menuData: MenuData(section: .reflect))
}
