//
//  SongEditorView.swift
//  Tobianw
//
//  Created by Holger Krupp on 26.05.24.
//

import SwiftUI
import Speech

struct SongEditorView: View {
    
    @State var song:Song
    
    
    var body: some View {
        
        VStack{
            TextField("Song title", text: $song.titel)
                .textFieldStyle(.roundedBorder)
            TextField("Lyrics", text: $song.lyrics, axis: .vertical)
                .lineLimit(15, reservesSpace: true)
                .textFieldStyle(.roundedBorder)
            Picker("Language", selection: $song.locate){
                ForEach(SFSpeechRecognizer.supportedLocales().map{$0.description}, id:\.self){locate in
                    Text(locate.description).tag(locate.description)
                }
            }
            
            NavigationLink {
                PlayerView(song: song)
                
            } label: {
                Text("Play")
            }
            
        }
        .padding()
 
    }
}

