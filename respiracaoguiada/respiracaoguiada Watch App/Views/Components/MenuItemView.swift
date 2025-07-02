//
//  MenuItemView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct MenuItemView: View {
    
    var menuData: MenuData
    
    @State var isInfo: Bool = false
    
    @ViewBuilder
    var leftView: some View {
        
        VStack(alignment: .leading,
               spacing: 2) {
            
            Image(systemName: self.menuData.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 26.0, height: 26.0)
                .padding(.horizontal, 2)
                .padding(.bottom, 6)
                .foregroundColor(Theme.Colors.projectColorLight)
        
            Text(self.menuData.title)
                .bold()
            
            Text("1 MIN")
                .font(.footnote)
                .foregroundColor(Theme.Colors.projectColorLight)
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
            .padding(8)
            Spacer()
        }
    }
    
    var body: some View {
        
        NavigationLink(destination: MindInfoView()) {
            
            HStack {
                
                leftView
                
                Spacer()
                
                rightView
            }
        }
        .frame(height: Theme.Dimensions.heightMenuItem)
        .buttonStyle(.plain)
        .background(
            Theme.Colors.projectColor.clipShape(RoundedRectangle(cornerRadius: Theme.Dimensions.cornerRadius))
        )
        .glassEffect(in: .rect(cornerRadius: Theme.Dimensions.cornerRadius))
        .fullScreenCover(isPresented: $isInfo,
                         content: {
            InfoView(menuData: self.menuData)
        })
    }
}

#Preview {
    MenuItemView(menuData: MenuData(section: .spirit))
}
