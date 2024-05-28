//
//  ContentView.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var habits = Habits(allHabits: [
        Habit(name: "Read Books", description: "Read for 15 minutes", count: 2),
        Habit(name: "Study Mathematics", description: "Study for 15 minutes", count: 4)
    ])
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.allHabits, id: \.self) { habit in
                    NavigationLink(destination: HabitView(habit: habit)) {
                        VStack(alignment: .leading) {
                            Text(habit.name)
                                .font(.headline)
                            Text(habit.description)
                                .foregroundColor(.secondary)
                        }
                        .fontDesign(.monospaced)
                    }
                }
                .onDelete(perform: { indexSet in
                    removeRows(at: indexSet)
                })
            }
            .navigationTitle("Habits")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Habit", systemImage: "plus") {
                        showingSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingSheet) {
                NewHabit(habits: $habits.allHabits)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        habits.allHabits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
