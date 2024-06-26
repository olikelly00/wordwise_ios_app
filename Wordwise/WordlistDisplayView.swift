//
//  WordlistDisplayView.swift
//  Wordwise
//
//  Created by Oli Kelly on 10/04/2024.
//

import SwiftUI

struct DefaultWordlistDisplayView: View {
    
    @State var language: String = ""
    @State var languagesindex: Int = 0
    @State var word: String = ""
    @State var words: [(id: UUID, word: String, meaning: String)] = []
    @State var wordindex: String = ""
    @State var meaning: String = ""
    @State var errorMessage: String?
    @State var sortedAlphabetically: Bool
    //var sortedWords: [String]
    
    var body: some View {
        VStack {
                Form {
                    Section(header: Text("Add your latest word here:")) {
                        VStack {
                            TextField("Enter your word here", text: $word)
                            TextField("Add the meaning of your word here", text: $meaning)
                            Button (action: {
                                guard !word.isEmpty && !meaning.isEmpty else {
                                    errorMessage = "Please add a word and its meaning to continue."
                                    return}
                                let id = UUID()
                                words.append((id: id, word: word, meaning: meaning))
                                word = ""
                                meaning = ""
                            }) {
                                Text("Add word")
                            }
                        }
                        if let errorMessage = errorMessage {
                            Text(errorMessage)
                                .foregroundColor(.red)
                        }
                        VStack {
                            Toggle("Sort list A-Z", isOn: $sortedAlphabetically)
                            List {
                                ForEach(words.indices, id: \.self) { index in
                                    NavigationLink(destination: WordDisplayView(word: words[index].word, wordindex: (words[index].id).uuidString, meaning:  words[index].meaning)) {
                                        if sortedAlphabetically {
                                            let sortedWords = words.sorted(by: { $0.word < $1.word })
                                            Text(sortedWords[index].word)
                                        } else {
                                            Text(words.reversed()[index].word)
                                        }
                                    }
                                    
                                }
                                .onDelete  { indexSet in
                                    for index in indexSet {
                                        if let deletionIndex = words.firstIndex(where: { $0.id == words[index].id }) {
                                            words.remove(at: deletionIndex)
                                        }
                                    }
                                }
                                }
                            }
                                    
                                    }
                                    
                                }
                                
                                
                                
                            }
                           
                        }
                        }
                
       




//struct WordlistDisplayView_Previews: PreviewProvider {
//    static var previews: some View {
//        DefaultWordlistDisplayView(sortedAlphabetically: false)
//    }
//}
