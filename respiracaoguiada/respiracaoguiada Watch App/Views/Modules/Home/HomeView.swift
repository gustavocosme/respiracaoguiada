//
//  HomeView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @ViewBuilder
    var menuView: some View {
        
        LazyVStack(spacing: 16.0) {
    
            MenuItemView(menuData: MenuData(section: .spirit))
            MenuItemView(menuData: MenuData(section: .reflect))
            MenuItemView(menuData: MenuData(section: .breathe))
        }
        .padding()
    }
    
    var body: some View {
        
        NavigationStack {
            
            ScrollView {
                menuView
            }
            .navigationTitle("Respiração Guiada")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    HomeView()
}
