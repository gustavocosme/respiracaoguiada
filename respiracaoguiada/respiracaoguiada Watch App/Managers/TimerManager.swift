//
//  TimerManager.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 02/07/25.
//

import Foundation
import SwiftUI
import Combine

class TimerManager: ObservableObject {
    @Published var timeRemaining: Int
    @Published var isRunning: Bool = true

    private var cancellable: AnyCancellable?
    private let totalSeconds: Int

    init(minutes: Int) {
        self.timeRemaining = minutes * 60
        self.totalSeconds = minutes * 60
        startTimer()
    }

    private func startTimer() {
        cancellable = Timer
            .publish(every: 1.0, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, self.isRunning else { return }
                if self.timeRemaining > 0 {
                    self.timeRemaining -= 1
                } else {
                    self.isRunning = false
                    self.cancellable?.cancel()
                }
            }
    }

    var progress: CGFloat {
        1 - CGFloat(timeRemaining) / CGFloat(totalSeconds)
    }

    var timeString: String {
        let minutes = timeRemaining / 60
        let seconds = timeRemaining % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
