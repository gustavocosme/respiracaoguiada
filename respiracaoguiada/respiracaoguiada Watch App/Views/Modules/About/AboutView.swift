//
//  AboutView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 10/07/25.
//

import SwiftUI

struct AboutView: View {
    
    var body: some View {
    
        ScrollView {
            
            VStack(alignment: .leading, spacing: 16) {
                
                Text("Respiração Guiada")
                    .font(.headline)
                
                Text("Este app foi criado para ajudar você a encontrar equilíbrio e paz em poucos minutos por dia. Com sessões guiadas de respiração, foco e reflexão, você pode transformar momentos de estresse em tranquilidade.")
                    .padding(.bottom, 22)
            }
        }
        .padding()
    }
}

#Preview {
    AboutView()
}
