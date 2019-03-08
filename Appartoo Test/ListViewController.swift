//
//  FirstViewController.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import UIKit

class ListViewController: UITableViewController, UISearchBarDelegate {

    let data = BarJsonData()
    @IBOutlet weak var barSearchBar: UISearchBar!


    private var visibleBars: Array<Bar> {
        get {
            return data.bars.filter {
                if let key = barSearchBar?.text, key != "" {
                    return $0.name.contains(key)
                } else {
                    return true
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        barSearchBar.delegate = self
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let barCell = tableView.dequeueReusableCell(withIdentifier: "reusable bar cell", for: indexPath) as! BarTableViewCell
        let bar = visibleBars[indexPath.item]



        barCell.textLabel?.text = bar.name
        barCell.detailTextLabel?.text = bar.address
        barCell.loadImage(from: bar.imageUrl)

        return barCell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show single location" {
            let barIndex = tableView.indexPath(for: sender as! UITableViewCell)!.item
            (segue.destination as! LocationPreviewModalController).specificBarToShow = data.bars[barIndex]
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return visibleBars.count
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        tableView.reloadData()
    }


}

