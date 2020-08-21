//
//  oxfordAPI.swift
//  ExpandMyVocab
//
//  Created by Shaggy Bremnath on 2020-08-20.
//  Copyright © 2020 Shaggy Bremnath. All rights reserved.
//

import Foundation




class OxfordAPI : ObservableObject{

    
    @Published var words =  [NewWord]()
    
    init() {
        
    }
    
    func findword(Word : String){
        let appId = "9a9bccb7"
        let appKey = "027e306a39199dd41834a1c6f5bcd74d"
        let language = "en-gb"
        let word = Word
        let fields = "pronunciations"
        let strictMatch = "false"
        let word_id = word.lowercased()
        let url = URL(string: "https://od-api.oxforddictionaries.com:443/api/v2/entries/\(language)/\(word_id)?fields=\(fields)&strictMatch=\(strictMatch)")!
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue(appId, forHTTPHeaderField: "app_id")
        request.addValue(appKey, forHTTPHeaderField: "app_key")

        let session = URLSession.shared
        _ = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let response = response,
                      let data = data,
                      let jsonData = try? JSONSerialization.jsonObject(with: data, options: .mutableContainers) {
                      print(response)
                      print(jsonData)
                  } else {
                      print(error)
                      print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
                  }
            
            
           do{
                          let fetch = try JSONDecoder().decode(results.self, from: data!)
                        
                          
                          for i in fetch.HeadwordEntry{
                              
                              DispatchQueue.main.async {
                                self.words.append(NewWord(id: i.id, Definitions: i.lexicalEntry.Entry.Sense.definitions))
                              }
                              
                          }
                          
                      }
                      catch{
                          print(error.localizedDescription)
                      }
        }).resume()
    }
    
    
    struct NewWord : Identifiable {
        var id: String
        var Definitions: [String]
        
    }
    
    struct results : Decodable {
        
        var HeadwordEntry: [lexicalEntries]
    }
    
    struct lexicalEntries : Decodable {
        var id : String
        var lexicalEntry : entries
    }
    
    struct entries : Decodable{
        var Entry: senses
    }

    struct senses : Decodable{
        var Sense: Type1
    }

    struct Type1 : Decodable {
        var definitions : [String]
    }
    
    
}
