//
//  InfoView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct InfoView: View {
    
    var menuData: MenuData
    @State var timer: String = ""
    
    var body: some View {
       
        NavigationStack {
            
            ScrollView {
            
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: InfoSelectView(menuData: menuData)) {
                        Text(timer)
                    }
                    .buttonStyle(.glass)
                    .padding(.bottom, 16)
                              
                    Text(menuData.description)
                        .foregroundStyle(.white)
                }
            }
            .padding(.horizontal, 16)
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle(menuData.title)
        }
        .onAppear {
            self.timer = menuData.timerStr
        }
    }
}

#Preview {
    InfoView(menuData: MenuData(section: .reflect))
}
