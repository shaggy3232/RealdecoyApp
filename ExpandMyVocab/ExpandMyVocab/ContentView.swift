//
//  ContentView.swift
//  ExpandMyVocab
//
//  Created by Shaggy Bremnath on 2020-08-20.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct WordCardView: View {
    
    var CWord:String
    var rDefinitions:[String]
    
    var body: some View {
        
        HStack{
            Text(self.CWord)
            VStack{
                Text(self.rDefinitions[1])
            }.padding(30)
            
        }
    }
}

struct wordlistView: View {
    
    @State var words: [objectwords]
    var body: some View{
       
        NavigationView{
            VStack{
            List(self.words, id:\.word) { objectwords in
                WordCardView(CWord: objectwords.word , rDefinitions: objectwords.definitions)
                }
            }.navigationBarTitle("Word List" )
        }
    }
}





struct ContentView: View {
    
    @ObservedObject var Oxford = OxfordAPI()
    @State private var newWord = ""
    @State private var wordList = [objectwords]()
    @State private var Word = objectwords(word: " ", definitions: [""] )
    @State private var isWordfound = false
    
    
    
    var body: some View {
        
        NavigationView{
         
                return ZStack{
                    VStack( spacing: 30){
                        
                        if isWordfound{
                        Text(self.Word.word)
                        Text(self.Word.definitions.last!)
                        }
                    TextField("What word do you want to Find", text: $newWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding()

                    
                    Button("Find word"){
                        
                        self.Oxford.findword(Word: self.newWord){ definition in
                            //check if definition is nil, add definition to Word
                            if let definition = definition{
                            self.Word.definitions.append(definition)
                                print(self.Word.definitions)
                            }
                        }
                         self.Word.word = self.newWord
                        self.isWordfound.toggle()
                        
                    }
                        if isWordfound{
                    
                    Button("Add word to you word List"){
                        self.wordList.append(self.Word)
                        
                    }
                        }
                        
                        NavigationLink(destination: wordlistView(words: wordList)){
                            Text("Word list")
                        }
                }
                .navigationBarTitle("Expand My Vocab!")
            }
        }
    }



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
    
}

struct objectwords : Identifiable {
    var id = UUID()
    var word: String
    var definitions: [String]
}
