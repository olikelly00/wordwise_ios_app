//
//  ChooseLanguageView.swift
//  Wordwise
//
//  Created by Oli Kelly on 10/04/2024.
//

import SwiftUI

struct ChooseLanguageView: View {
    
    @State var language: String = ""
    @State var languages: [String] = []
    
    
    var body: some View {
            VStack {
                Form {
                    Section(header: Text("Add your chosen language to get started")) {
                        VStack {
                            HStack {
                                TextField("My chosen language is...", text: $language)
                                Button (action: {
                                    guard !language.isEmpty else {return}
                                    languages.append(language)
                                    language = ""
                                    
                                }) {
                                    Text("Add language")
                                }
                            }
                        }
                        
                        Section {
                            ForEach(languages.indices, id: \.self) {index in
                                NavigationLink(destination: DefaultWordlistDisplayView(sortedAlphabetically: false)) {
                                    Text(languages[index])
                                }
                            }
                            
                        }
                    }
                    
                    
                    
                }
            }
        }
}

struct ChooseLanguageView_Previews: PreviewProvider {
    static var previews: some View {
        ChooseLanguageView()
    }
}
