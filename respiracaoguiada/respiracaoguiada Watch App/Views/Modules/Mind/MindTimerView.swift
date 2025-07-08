//
//  MindTimerView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 04/07/25.
//

import SwiftUI

struct MindTimerView: View {
    
    @StateObject private var timerManager: TimerManager

    init(minutes: Int, onComplete: @escaping (() -> Void)) {
        _timerManager = StateObject(wrappedValue: TimerManager(minutes: minutes,
                                                               onComplete: onComplete))
    }

    var body: some View {
        
        VStack(spacing: 26) {
            
            ZStack {
                
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.2)
                    .foregroundColor(Theme.Colors.projectColorLight)

                Circle()
                    .trim(from: 0.0, to: timerManager.progress)
                    .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                    .foregroundColor(Theme.Colors.projectColor)
                    .rotationEffect(.degrees(-90))
                    .animation(.linear, value: timerManager.progress)

                Text(timerManager.timeString)
                    .font(.title3)
                    .frame(width: 100)
                    .foregroundColor(.white)
                    .bold()
            }
            .frame(width: 100, height: 100)
      
            Button(action: {
                timerManager.isRunning.toggle()
            }) {
                Image(systemName: timerManager.isRunning ? "play.fill" : "pause.fill")
                      .frame(width: 33.0, height: 33.0)
                      .glassEffect()
            }
            .buttonStyle(.plain)
            
        }
    }
}

#Preview {
    MindTimerView(minutes: 1, onComplete: {})
}
