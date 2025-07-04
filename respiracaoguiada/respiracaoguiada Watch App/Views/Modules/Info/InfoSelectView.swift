//
//  InfoSelectView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 04/07/25.
//

import SwiftUI

struct InfoSelectView: View {
    
    let menuData: MenuData
    @Environment(\.dismiss) var dismiss
    let timers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @State var timer: String = ""

    var body: some View {
    
        ScrollView {
            
            LazyVStack(spacing: 8.0) {
                
                ForEach(timers, id: \.self) { time in

                    let plural = time == 1 ? "" : "s"
                    let str = "\(time) Minuto\(plural)"
                    Button(str) {
                        PreferenceManager.shared.setTimer(section: menuData.section, time: time)
                        
                        timer = str
                        
                        dismiss()
                    }
                    .buttonStyle(.glass)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(menuData.title)
        .padding()
    }
}

#Preview {
    InfoSelectView(menuData: MenuData.init(section: .reflect))
}
