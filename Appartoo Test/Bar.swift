//
//  Bar.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import Foundation

struct Bar {
    let id: Int
    let address: String
    let name: String
    let url: URL
    let imageUrl: URL
    let tags: String
    let coordinates: (latitude: Double, longitude: Double)

    init(from parsedJson: Dictionary<String, AnyObject>) {
        id = parsedJson["id"] as! Int
        address =  parsedJson["address"] as! String
        name = parsedJson["name"] as! String
        url = URL(string: parsedJson["url"] as! String)!
        imageUrl = URL(string: "https://loremflickr.com/100/100")!//parsedJson["image_url"] as! String)!
        tags = parsedJson["tags"] as? String ?? ""
        coordinates =  (
            latitude: parsedJson["latitude"] as! Double,
            longitude: parsedJson["longitude"] as! Double
        )
    }
}
