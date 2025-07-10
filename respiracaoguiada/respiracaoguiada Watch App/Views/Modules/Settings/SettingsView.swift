//
//  SettingsView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 10/07/25.
//

import SwiftUI

struct SettingsView: View {
    
    var version: String {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "1.0"
    }
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 8.0) {
            Text("Versão - \(version)")
                .bold()
            Text("Feito por\nGustavo Cosme")
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SettingsView()
}
