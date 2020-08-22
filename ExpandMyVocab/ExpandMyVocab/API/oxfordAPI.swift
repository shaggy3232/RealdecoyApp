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
    
    func findword(Word : String, completion:@escaping (String?) -> Void ){
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
            
            if let data = data {
                
                
                let decoder = JSONDecoder()
               
                do{
                    var decodedData = try decoder.decode(Entries.self, from: data)
                    var definition = "sfadfa"
                    if word_id == "kill"{
                        decodedData.results[0].lexicalEntries[0].entries[0].senses = [Sense(definitions: ["random string"])]
                    }
                    print(decodedData)
                    definition = decodedData.results[0].lexicalEntries[0].entries[0].senses?[0].definitions?.last ?? "definition not found"
                    completion(definition)
                    
                } catch let e{
                    print(e)
                    
                }
            
                  } else {
                      print(error)
                      print(NSString.init(data: data!, encoding: String.Encoding.utf8.rawValue))
                  }
            
            
         
        }).resume()
    }
    
    
    
    
    
    

    
    struct Entries : Decodable {
        var metadata: Metadata
        var results: [HeadwordEntry]
    }
    
    struct HeadwordEntry : Decodable{
        var id: String
        var lexicalEntries : [lexicalEntry]
    }
    struct Metadata : Decodable{
        var operation: String
        var provider: String
        var schema: String
    }
    struct lexicalEntry : Decodable {
        
        var entries : [Entry]
    }
    
    struct Entry : Decodable{
        var senses : [Sense]?
    }

    struct Sense : Decodable{
        var definitions: [String]?
    }

   
  
    
    
}

struct NewWord : Identifiable {
    var id: String
    var Definitions: [String]
    
    
}

extension NewWord{
                     init?(jsondata: [String: Any]){
                       guard let id = jsondata["id"] as? String,
                        let headwordentry = jsondata["HeadWordEntry"] as? [String],
    
                        let definitions = jsondata["definitions"] as? [String]
                           else{
                               return nil
                       }
                         
                        
                        self.id = id
                        self.Definitions = definitions
                     }
                 }
