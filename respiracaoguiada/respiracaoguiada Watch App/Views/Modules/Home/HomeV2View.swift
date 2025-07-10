//
//  HomeV2iew.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct HomeV2View: View {
    
    @StateObject var spiritData = MenuData(section: .spirit)
    @StateObject var reflectData = MenuData(section: .reflect)
    @StateObject var breatheData = MenuData(section: .breathe)
    
    @ViewBuilder
    var menuView: some View {
        
        TabView {
            MenuFullItemView(menuData: spiritData)
            MenuFullItemView(menuData: reflectData)
            MenuFullItemView(menuData: breatheData)
        }
        .tabViewStyle(.verticalPage)
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                LinearGradient(
                    gradient: Gradient(colors: [Color.black,
                                                Color.black,
                                                Theme.Colors.projectColor]),
                    startPoint: .topLeading,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
                
                menuView
            }
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

#Preview {
    HomeV2View()
}
