//
//  HapticManager.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 09/07/25.
//

import Foundation
import WatchKit
import SwiftUI
import Combine

class HapticManager: ObservableObject {

    @Published var isInhaling = true

    private let duration: TimeInterval = 4
    private var timer: Timer?

    func start() {
        timer = Timer.scheduledTimer(withTimeInterval: duration, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            DispatchQueue.main.async {
                self.isInhaling.toggle()
                WKInterfaceDevice.current().play(.start)
            }
        }
    }

    func stop() {
        timer?.invalidate()
        timer = nil
    }
}
