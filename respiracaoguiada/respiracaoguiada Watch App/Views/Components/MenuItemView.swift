//
//  MenuItemView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct MenuItemView: View {
    
    var title: String
    var icon: String
    var timer: String
    
    @State var isInfo: Bool = false
    
    @ViewBuilder
    var leftView: some View {
        
        VStack(alignment: .leading,
               spacing: 2) {
            
            Image(systemName: self.icon)
                .resizable()
                .scaledToFit()
                .frame(width: 26.0, height: 26.0)
                .padding(.horizontal, 2)
                .padding(.bottom, 6)
        
            Text(self.title)
                .bold()
            
            Text(self.timer)
                .font(.footnote)

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
                                .foregroundStyle(.white.opacity(0.8))
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
        .frame(height: 100)
        .buttonStyle(.plain)
        .background(
            Color.greenProject.clipShape(RoundedRectangle(cornerRadius: Float.cornerRadius))
        )
        .glassEffect(in: .rect(cornerRadius: 22.0))
        .fullScreenCover(isPresented: $isInfo,
                         content: {
            Text("OK")
        })
    }
}

#Preview {
    MenuItemView(title: "Espirito",
                 icon: "aqi.medium",
                 timer: "1 MIN",
                 isInfo: false)
}
