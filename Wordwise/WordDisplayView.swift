//
//  WordDisplayView.swift
//  Wordwise
//
//  Created by Oli Kelly on 10/04/2024.
//

import SwiftUI


struct WordDisplayView: View {

    @State var word: String
    @State var wordindex : String?
    @State var meaning: String
    @State var wordexamples: [String] = []
    @State var wordexample: String = ""
    
    var body: some View {
        VStack{
        Text("\(word) : \(meaning)")
            Form {
                Section(header: Text("Add an example of how to use your word?")) {
                    
                    
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
            }
        }
    }


struct WordDisplayView_Previews: PreviewProvider {
    static var previews: some View {
        WordDisplayView(word: "TestWord", meaning: "TestMeaning")
    }
}
