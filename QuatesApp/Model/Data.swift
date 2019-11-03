//
//  Data.swift
//  QuatesApp
//
//  Created by Erkan on 9/7/19.
//  Copyright © 2019 Erkan. All rights reserved.
//

import SwiftUI
import UIKit

let quoteData: [Quote] = load("quotes.json")

func load<T: Decodable>(_ filename: String, as type: T.Type = T.self)->T {
    let data: Data
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldnt find \(filename) in main bundle")
    }
    do { data = try Data(contentsOf: file)
        
    } catch {
        fatalError("Couldnt load \(filename) from main bundle:\n\(error)")
    }
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{ fatalError("Couldnt parse \(filename) as \(T.self):\n\(error)")}
    
}
