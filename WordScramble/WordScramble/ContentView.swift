//
//  ContentView.swift
//  WordScramble
//
//  Created by Groo on 5/12/24.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var newWord = ""
    @State private var rootWord = ""
    var body: some View {
        NavigationStack {
            List {
                Section {
                    TextField("Enter your word", text: $newWord)
                        .textInputAutocapitalization(.never)
                }
                Section {
                    ForEach(usedWords, id: \.self) { word in
                        HStack {
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
        }
        .navigationTitle(rootWord)
        .onSubmit(addWord)
    }
    
    func addWord() {
        let word = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard word.count > 0 else { return }
        withAnimation {
            usedWords.insert(word, at: 0)
        }
        newWord = ""
    }
}

#Preview {
    ContentView()
}
