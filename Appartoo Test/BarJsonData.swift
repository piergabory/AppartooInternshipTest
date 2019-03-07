//
//  Model.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import Foundation

struct BarJsonData {

    private let jsonFileName = "data"
    private let data: Dictionary<String, AnyObject>

    var bars: Array<Bar> {
        get {
            return (data["bars"] as! NSArray).map({ Bar(from: $0 as! Dictionary<String, AnyObject>) })
        }
    }

    init() {
        guard
            let path = Bundle.main.path(forResource: jsonFileName, ofType: "json"),
            let fileData = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let parsedJsonData = try? JSONSerialization.jsonObject(with: fileData, options: .mutableLeaves) as? Dictionary<String, AnyObject>
        else {
            data = [:]
            return
        }

        data = parsedJsonData!
    }
}
