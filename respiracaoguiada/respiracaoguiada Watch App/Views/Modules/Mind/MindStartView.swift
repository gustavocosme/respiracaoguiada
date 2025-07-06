//
//  MindStartView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct MindStartView: View {
   
    @Environment(\.dismiss) var dismiss
    @State private var pageIndex = 2

    var body: some View {
        
        TabView(selection: $pageIndex) {
            
            Button("Finalizar"){
                self.dismiss()
            }
            .bold()
            .glassEffect(.regular.tint(.red).interactive())
            .padding(.horizontal, 22)
                .tag(1)
            
            Text("Animação")
                .tag(2)
            
            MindTimerView(minutes: 1, onComplete: {
                self.dismiss()
            })
        }
        .tabViewStyle(.page)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    
    MindStartView()
    
}
