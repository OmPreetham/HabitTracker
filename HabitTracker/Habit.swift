//
//  Habit.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import Foundation

struct Habit: Codable, Hashable, Identifiable {
    var id = UUID()
    var name: String
    var description: String
    var count: Int
    
    init(id: UUID = UUID(), name: String, description: String, count: Int) {
        self.id = id
        self.name = name
        self.description = description
        self.count = count
    }
}

@Observable
class Habits {
    var allHabits: [Habit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(allHabits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedItems = try? JSONDecoder().decode([Habit].self, from: savedItems) {
                allHabits = decodedItems
                return
            }
        }
        allHabits = []
    }
}

