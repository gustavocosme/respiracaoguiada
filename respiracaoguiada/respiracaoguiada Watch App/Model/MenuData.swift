//
//  MenuData.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import Foundation

struct MenuData {
    
    enum Section: String {
        case spirit = "spirit"
        case breathe = "breathe"
        case reflect = "reflect"
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
    
    var description: String {
        
        switch section {
            
        case .spirit:
            """
            Descubra o poder da meditação para o espírito.
            Silencie o mundo lá fora e ouça a voz que vive dentro de você. A meditação acalma a mente, eleva o espírito e fortalece a conexão com o seu eu interior.
            Basta sentar-se em silêncio, focar na respiração e permitir que cada pensamento vá e venha como nuvens no céu.
            Com prática, você encontrará paz, clareza e presença. Meditar é um caminho simples para viver com mais leveza, propósito e alma.  
            """
        case .breathe:
            """
            Respirar é se reconectar.
            A cada inspiração, você acolhe a vida. A cada expiração, você solta o que não precisa mais.
            Respirar com consciência acalma o corpo, aquieta a mente e desperta o espírito.
            Feche os olhos, inspire lentamente pelo nariz… segure… e expire com leveza pela boca.
            Repita.
            Neste simples gesto, mora a presença. E onde há presença, há paz.
            """
        case .reflect:
            """
            Refletir é iluminar o espírito.
            Quando você silencia o mundo e olha para dentro, encontra respostas que estavam escondidas no ruído.
            A reflexão na meditação te ajuda a entender suas emoções, escolhas e caminhos.
            Não se trata de julgar, mas de observar com amor e consciência.
            Permita-se sentir, questionar e crescer.
            Na quietude, a alma fala.
            """
        }
    }
    
    var timerInt: Int {
       return PreferenceManager.shared.getTimer(section: section) ?? 0
    }
    
    var timerStr: String {
        if timerInt == 0 {
            return "1 minuto"
        }
        
        return self.timerInt == 1 ? "\(self.timerInt) minuto" : "\(self.timerInt) minutos"
    }
}
