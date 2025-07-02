//
//  MenuData.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import Foundation

struct MenuData {
    
    enum Section {
        case spirit
        case breathe
        case reflect
    }
    
    let section: Section
    
    var title: String {
        switch section {
        case .spirit:
            return "Espírito"
        case .breathe:
            return "Respirar"
        case .reflect:
            return "Refletir"
        }
    }
    
    var icon: String {
        switch section {
        case .spirit:
            return "figure.mind.and.body"
        case .breathe:
            return "aqi.medium"
        case .reflect:
            return "wind"
        }
    }
}
