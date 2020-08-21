//
//  ContentView.swift
//  ExpandMyVocab
//
//  Created by Shaggy Bremnath on 2020-08-20.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI


struct WordlistView: View{
    var WordList: [String]
    
    var body: some View{
        
        return ZStack{
            VStack{
                Text("these are the words you saved")
                
            }
        }
    }
}




struct ContentView: View {
    
    @ObservedObject var Oxford = OxfordAPI()
    @State private var newWord = " "
    @State private var WordList = []
    
    
    var body: some View {
        
        NavigationView{
            
    
            
        
        
                return ZStack{
                    VStack{
                        
                    TextField("What word do you want to Find", text: $newWord)

                        
                    Spacer()

                    
                    Button("Find word"){
                        self.Oxford.findword(Word: "dollar")
                    }
                        
                    
                        Spacer()

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



