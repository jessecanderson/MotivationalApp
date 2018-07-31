//
//  NetworkHandler.swift
//  MotivationalQuotes
//
//  Created by Jesse Anderson on 7/30/18.
//  Copyright © 2018 Jesse Anderson. All rights reserved.
//

import Foundation

class NetworkHandler {
    
    let urlString = "https://quotes.rest/qod.json?category=inspire"
    
    
    func makeNetworkCall(completion: @escaping (_ quoteResponse: QuoteResponse?) -> Void)  {
        
        guard let url = URL(string: urlString) else {
            return
            
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            
            guard let data = data else {
                return
                
            }
            
            do {
                let quoteResponse = try JSONDecoder().decode(QuoteResponse.self, from: data)
                
                completion(quoteResponse)
                
            } catch let jsonError {
                print(jsonError)
            }
            
        }.resume()
    }
}
