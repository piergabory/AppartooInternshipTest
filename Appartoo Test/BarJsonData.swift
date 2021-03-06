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
            return (data["bars"] as! NSArray)
                .map { Bar(from: $0 as! Dictionary<String, AnyObject>) }
                .sorted { $0.name < $1.name }
        }
    }

    init() {
        let path = Bundle.main.path(forResource: jsonFileName, ofType: "json")
        let fileData = try! Data(contentsOf: URL(fileURLWithPath: path!), options: .mappedIfSafe)
        data = try! JSONSerialization.jsonObject(with: fileData, options: .mutableLeaves) as! Dictionary<String, AnyObject>
    }
}
