//
//  FirstViewController.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController {

    let data = BarJsonData()

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let barCell = tableView.dequeueReusableCell(withIdentifier: "reusable bar cell", for: indexPath)
        let bar = data.bars[indexPath.item]

        barCell.textLabel?.text = bar.name
        barCell.detailTextLabel?.text = bar.address

        return barCell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.bars.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

