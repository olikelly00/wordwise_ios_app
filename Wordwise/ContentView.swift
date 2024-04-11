//
//  ContentView.swift
//  Wordwise
//
//  Created by Oli Kelly on 10/04/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Image("rosetta stone")
                    .frame(width: 32.0, height: 32.0)
                    .padding(.top, 240)
                    .opacity(0.6)
                    
                Text("Welcome to")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .padding(.top, 10)
                Text("Wordwise")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    
                Text("Revamp your vocabulary\nin *any* language")
                    .padding(.top, 5)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding(.top, 20)
                    .fontWeight(.light)
                
                
                NavigationLink(destination:ChooseLanguageView()) {
                    Text("**Tap here to get started**")
                        .font(.callout)
                        .padding(.top, 80)
                        .multilineTextAlignment(.center)
                }
                .padding()
            }
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
