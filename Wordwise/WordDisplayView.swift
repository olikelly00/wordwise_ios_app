//
//  WordDisplayView.swift
//  Wordwise
//
//  Created by Oli Kelly on 10/04/2024.
//

import SwiftUI


struct WordDisplayView: View {

    @State var word: String
    @State var wordindex : Int
    @State var meaning: String
    @State var wordexamples: [String] = []
    @State var wordexample: String = ""
    
    var body: some View {
        VStack{
        
            Form {
                Section(header: Text("Add an example of how to use your word?")) {
                    Text("This word means: \(meaning)")
                    TextField("Add your example here", text: $wordexample, axis: .vertical)
                    Button (action: {
                        guard !wordexample.isEmpty else {return}
                        wordexamples.append(wordexample)
                        wordexample = ""
                        
                    }) {
                        Text("Add example")
                    }
                    
                }
                Section {
                    ForEach(wordexamples, id: \.self) {note in
                        Text(note)
                        }
                    }
                
                }
            .navigationTitle("Your word: \(word)")
            }
        }
    }
