//
//  HabitView.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import SwiftUI

struct HabitView: View {
    @Binding var habit: Habit
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text(habit.description)
                .font(.body)
                .foregroundColor(.secondary)
            
            HStack(spacing: 20) {
                Text("Count:")
                    .font(.headline)
                Text("\(habit.count)")
                    .font(.headline)
                    .foregroundColor(.blue)
            }
            
            Button(action: {
                habit.increaseCount()
            }) {
                Text("Increase Count")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationBarTitle(habit.name)
        Spacer()
    }
}

//#Preview {
//    HabitView(habit: Habit(name: "Read Books", description: "Read for 15 minutes", count: 2))
//}
