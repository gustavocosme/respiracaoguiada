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
    
        ScrollView {
        
            VStack(alignment: .leading) {
                
                Text(menuData.title.uppercased())
                    .font(.title3)
                    .padding(.bottom, 4)
                    .bold()
                
                Text(menuData.description)
                    .foregroundStyle(.white)
            }
        }
        .padding(.horizontal, 16)
    }
}

#Preview {
    InfoView(menuData: MenuData(section: .reflect))
}
