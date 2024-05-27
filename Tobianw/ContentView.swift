//
//  ContentView.swift
//  Tobianw
//
//  Created by Holger Krupp on 26.05.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var songs: [Song]

    var body: some View {
        NavigationSplitView {
            List {
                ForEach(songs) { song in
                    NavigationLink {
                        SongEditorView(song: song)
                        
                    } label: {
                        Text(song.titel)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
        } detail: {
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Song(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(songs[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Song.self, inMemory: true)
}
