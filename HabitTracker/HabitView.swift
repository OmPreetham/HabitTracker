//
//  HabitView.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import SwiftUI

struct HabitView: View {
    var habit: Habit
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading) {
                Text(habit.description)
                    .fontDesign(.monospaced)
                Text("\(habit.count)")
                    .fontDesign(.monospaced)
            }
            .navigationTitle(habit.name)
        }
    }
}

#Preview {
    HabitView(habit: Habit(name: "Read Books", description: "Read for 15 minutes", count: 2))
}
