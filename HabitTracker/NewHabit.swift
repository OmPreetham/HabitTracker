//
//  NewHabit.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import SwiftUI

struct NewHabit: View {
    @Environment(\.dismiss) var dismiss
    @Binding var habits: [Habit]
    
    @State private var habitName = ""
    @State private var habitDescription = ""
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Habit Name", text: $habitName)
                TextField("Habit Description", text: $habitDescription)
            }
            .navigationTitle("New Habit")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let newHabit = Habit(name: habitName, description: habitDescription, count: 0)
                        habits.append(newHabit)
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}
