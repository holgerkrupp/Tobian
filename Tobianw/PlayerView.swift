import SwiftUI

struct PlayerView: View {
    @State var song: Song
    
    private var textLines: [String] {
        song.lyrics.components(separatedBy: .newlines)
    }
    @ObservedObject private var speechRecognizer : SpeechRecognizer

    init(song: Song) {
        self.song = song
        self.speechRecognizer = SpeechRecognizer(locale: Locale(identifier: song.locate))
      
    }
    
    @State private var highlightedLine: String? = nil
    @State private var currentWordIndex: Int = 0
    @State private var recognizedWords: [String] = []
    

    
    var body: some View {
        VStack {
            ScrollView {
                VStack(alignment: .leading) {
                    ForEach(textLines, id: \.self) { line in
                        Text(line)
                            .padding()
                            .font(line == highlightedLine ? .headline.bold() : .body)
                    }
                }
            }
            .onChange(of: speechRecognizer.spokenText) { newWord in
                handleRecognizedWord(newWord)
            }
            
            HStack {
                Button("Start Listening") {
                    speechRecognizer.startListening()
                }
                .padding()
                
                Button("Stop Listening") {
                    speechRecognizer.stopListening()
                }
                .padding()
            }
        }
        .onAppear {
            speechRecognizer.requestAuthorization()
        }
    }
    
    private func handleRecognizedWord(_ word: String) {
        recognizedWords.append(word)
        highlightLineForCurrentWords()
    }
    
    private func highlightLineForCurrentWords() {
        let currentRecognizedText = recognizedWords.joined(separator: " ").lowercased()
        
        for line in textLines {
            if line.lowercased().contains(currentRecognizedText) {
                highlightedLine = line
                // Reset recognized words to start tracking the next line
                recognizedWords = []
                break
            }
        }
    }
}
