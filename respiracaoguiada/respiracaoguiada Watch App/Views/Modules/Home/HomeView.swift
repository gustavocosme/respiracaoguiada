//
//  HomeView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI


struct HomeView: View {
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
        
                LazyVStack {
                    
                    MenuItemView(title: "Espírito",
                                 icon: "figure.mind.and.body",
                                 timer: "Aberto")
                    
                    MenuItemView(title: "Refletir",
                                 icon: "aqi.medium",
                                 timer: "1 MIN")
                    
                    MenuItemView(title: "Respirar",
                                 icon: "wind",
                                 timer: "1 MIN")
                }
                .padding()
            }
            .navigationTitle("Respiração Guiada")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    HomeView()
}
