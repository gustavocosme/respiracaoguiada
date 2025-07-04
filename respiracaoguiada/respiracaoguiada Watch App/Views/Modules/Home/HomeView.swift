//
//  HomeView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var spiritData = MenuData(section: .spirit)
    @StateObject var reflectData = MenuData(section: .reflect)
    @StateObject var breatheData = MenuData(section: .breathe)
    
    @ViewBuilder
    var menuView: some View {
        
        LazyVStack(spacing: 16.0) {
    
            MenuItemView(menuData: spiritData)
            MenuItemView(menuData: reflectData)
            MenuItemView(menuData: reflectData)
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
