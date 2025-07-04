//
//  PreferenceManager.swift
//  respiracaoguiada Watch App
//
//  Created by Gustavo Cosme on 04/07/25.
//

import Foundation

final class PreferenceManager {
    
    static let shared = PreferenceManager()
    private let defaults = UserDefaults.standard
    
    private init() {}
    
    
    // MARK: - Generic Setters
    
    private func set<T>(_ value: T, forKey key: String) {
        defaults.set(value, forKey: key)
    }
    
    
    // MARK: - Generic Getters
    
    private func get<T>(forKey key: String) -> T? {
        return defaults.object(forKey: key) as? T
    }
    
    
    // MARK: - Specific Helpers
    
    private func getInt(forKey key: String) -> Int? {
        return defaults.integer(forKey: key)
    }
    
    private func setInt(_ value: Int, forKey key: String) {
        defaults.set(value, forKey: key)
    }
}


 //MARK: - Public

extension PreferenceManager {
    
    public func setTimer(section: MenuData.Section,
                         time: Int) {
        self.setInt(time, forKey: section.rawValue)
    }
    
    public func getTimer(section: MenuData.Section) -> Int? {
        self.getInt(forKey: section.rawValue)
    }
}
