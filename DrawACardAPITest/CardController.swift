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
        
        let newDeckURL = baseURL.appendingPathComponent("new")
        let drawURL = newDeckURL.appendingPathComponent("draw")
        
        let countQueryItem = URLQueryItem(name: "count", value: "\(numberOfCards)")
    }
}
