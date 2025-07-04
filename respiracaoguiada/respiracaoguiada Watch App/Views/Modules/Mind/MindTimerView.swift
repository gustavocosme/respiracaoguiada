//
//  MindTimerView.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 04/07/25.
//

import SwiftUI

struct MindTimerView: View {
    
    @StateObject private var timerManager: TimerManager

    init(minutes: Int) {
        _timerManager = StateObject(wrappedValue: TimerManager(minutes: minutes))
    }

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.2)
                .foregroundColor(Theme.Colors.projectColorLight)

            Circle()
                .trim(from: 0.0, to: timerManager.progress)
                .stroke(style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .foregroundColor(Theme.Colors.projectColor)
                .rotationEffect(.degrees(-90))
                .animation(.linear, value: timerManager.progress)

            Text(timerManager.timeString)
                .font(.title2)
                .frame(width: 100)
                .foregroundColor(.white)
                .bold()
        }
        .frame(width: 120, height: 120)
    }
}

#Preview {
    MindTimerView(minutes: 1)
}
