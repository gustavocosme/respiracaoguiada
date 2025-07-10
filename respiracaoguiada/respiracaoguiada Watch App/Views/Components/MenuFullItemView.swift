

//
//  MenuItemView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct MenuFullItemView: View {
    
    @ObservedObject var menuData: MenuData
    @State var isInfo: Bool = false
    
    @ViewBuilder
    var leftView: some View {
        
        VStack(alignment: .leading,
               spacing: 2) {
        
            Image(systemName: self.menuData.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 44.0, height: 44.0)
                .padding(.horizontal, 2)
                .foregroundColor(Theme.Colors.projectColorLight)
                .accessibilityHidden(true)

            Text(self.menuData.title)
                .bold()
                .accessibilityLabel("Título: \(self.menuData.title)")

            Spacer()
            
            Text(self.menuData.timerStr)
                .font(.footnote)
                .foregroundColor(Theme.Colors.projectColorLight)
                .accessibilityLabel("Tempo: \(self.menuData.timerStr)")
        }
        .padding(16)
    }

    @ViewBuilder
    var rightView: some View {
        
        VStack {

            Button(action: {

                self.isInfo = true

            }) {
                Image(systemName: "ellipsis.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 22.0, height: 22.0)
                                .foregroundStyle(Theme.Colors.projectColorLight)
            }
            .buttonStyle(.plain)
            Spacer()
        }
        .accessibilityLabel("Mais informações")
        .accessibilityHint("Abre a tela de detalhes sobre \(menuData.title)")
        .padding(.horizontal, 22)
    }
    
    var body: some View {
        
        NavigationLink(destination: MindStartView(menuData: self.menuData)) {
            
            HStack {
                
                leftView
                
                Spacer()
                
                rightView
            }
        }
        .buttonStyle(.plain)
        .fullScreenCover(isPresented: $isInfo,
                         content: {
            InfoView(menuData: self.menuData)
        })
    }
}

#Preview {
    MenuFullItemView(menuData: MenuData(section: .spirit))
}
