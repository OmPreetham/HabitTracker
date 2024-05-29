//
//  ContentView.swift
//  HabitTracker
//
//  Created by Om Preetham Bandi on 5/28/24.
//

import SwiftUI

struct ContentView: View {
    @State private var habitStore = HabitStore()
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(Array(habitStore.allHabits.enumerated()), id: \.element) { index, habit in
                    NavigationLink(destination: HabitView(habit: $habitStore.allHabits[index])) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(habit.name)
                                    .font(.headline)
                                Text(habit.description)
                                    .foregroundColor(.secondary)
                            }
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button {
                            habitStore.allHabits[index].increaseCount()
                        } label: {
                            Label("Increase", systemImage: "plus")
                        }
                        .tint(.green)
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
                NewHabit(habits: $habitStore.allHabits)
            }
        }
    }
    
    func removeRows(at offsets: IndexSet) {
        habitStore.allHabits.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
