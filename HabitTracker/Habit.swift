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
    var allHabits: [Habit]
    
    init(allHabits: [Habit]) {
        self.allHabits = allHabits
    }
}
