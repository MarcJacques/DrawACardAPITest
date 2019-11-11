//
//  CardController.swift
//  DrawACardAPITest
//
//  Created by Marc Jacques on 11/10/19.
//  Copyright © 2019 Marc Jacques. All rights reserved.
//

import Foundation

class CardController {
    //after choosing an api and determining what you want to do with it the first thing needed is the baseUrl. This is the base of the web address neeeded to perform all requests to api.
    let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/")!
    
    //next study the functions and the type of data the API can help you with. Become familiar with everything needed to perform the request.
    func draw(numberOfCards: Int, completion: @escaping ([Card]) -> Void) {
        //now you need to find out the appending paths and compnents that allow you to access a property or action grom the API
        let newDeckURL = baseURL.appendingPathComponent("new")
        let drawURL = newDeckURL.appendingPathComponent("draw")
        //urlcomponents and appending path components figure out what's needed to make the link or address work with the information your addingto the link. So it formats the url into the proper structure for you.
        var urlComponents =  URLComponents(url: drawURL, resolvingAgainstBaseURL: true)
    
        let countQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
        
        urlComponents?.queryItems = [countQueryItem]
        
        guard let requestURL = urlComponents?.url else { return }
        
        //now we need to create a urlSession that will return us some data
       
        URLSession.shared.dataTask(with: requestURL) { (data, _, error) in
            //code in this closure only starts after connecting to the api.
            //We need to Get the data and turn it into an array of Cards
            
            if let error = error {
                NSLog("Error with data task: \(error)")
                completion(nil)
            }
            
        }.resume() // Starts the data task. Without this the data task would never go to the API.
        
    }
}
