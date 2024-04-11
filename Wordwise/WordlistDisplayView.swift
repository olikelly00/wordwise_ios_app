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
    @State var words: [(word: String, meaning: String)] = []
    @State var wordindex: Int = 0
    @State var meaning: String = ""
    @State var errorMessage: String?
    @State var sortedAlphabetically: Bool
    //var sortedWords: [String]
    
    var body: some View {
        VStack {
            NavigationView {
                Form {
                    Section(header: Text("Add your latest word here:")) {
                        VStack {
                            TextField("Enter your word here", text: $word)
                            TextField("Add the meaning of your word here", text: $meaning)
                            Button (action: {
                                guard !word.isEmpty && !meaning.isEmpty else {
                                    errorMessage = "Please add a word and its meaning to continue."
                                    return}
                                words.append((word: word, meaning: meaning))
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
//                                    Button(action: {
                                    /*}) *//*{*/
                                        NavigationLink(destination: WordDisplayView(word: words[index].word, wordindex: index+1, meaning:  words[index].meaning)) {
                                            if sortedAlphabetically {
                                                let sortedWords = words.sorted(by: { $0.word < $1.word })
                                                Text(sortedWords[index].word)
                                            } else {
                                                Text(words.reversed()[index].word)
                                            }
                                            
                                        }
                                        
                                        
                                        
                                        
                                        
                                    }
                                .onDelete(perform: removeRows)
                                }
//                                .onDelete(perform: removeRows)
                            }
                        }
                    }
                }
            }
          
            }
    func removeRows(at offsets: IndexSet) {
        words.remove(atOffsets: offsets)
        }
  
    }


