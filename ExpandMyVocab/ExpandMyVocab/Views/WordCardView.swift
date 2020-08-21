//
//  WordCardView.swift
//  ExpandMyVocab
//
//  Created by Shaggy Bremnath on 2020-08-20.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import SwiftUI

struct WordCardView: View {
    
    @Binding var CWord:String
    @Binding var rDefinitions:[String]
    
    var body: some View {
        
        return VStack{
            Text(self.CWord)
            
        }
    }
}

struct WordCardView_Previews: PreviewProvider {
    static var previews: some View {
        WordCardView(CWord: Binding.constant("sdfadsf"), rDefinitions: Binding.constant(["asdfasdf","sdfasdf"]))
    }
}
