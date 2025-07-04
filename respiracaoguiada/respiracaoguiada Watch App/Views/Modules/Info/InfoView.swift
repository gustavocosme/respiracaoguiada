//
//  InfoView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import SwiftUI

struct InfoView: View {
    
    var menuData: MenuData
    
    var body: some View {
       
        NavigationStack {
            
            ScrollView {
            
                VStack(alignment: .leading) {
                    
                    NavigationLink(destination: InfoSelectView(menuData: menuData)) {
                        
                       Text("1 MIN")
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
    }
}

#Preview {
    InfoView(menuData: MenuData(section: .reflect))
}
