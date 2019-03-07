//
//  BarTableViewCell.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import UIKit

class BarTableViewCell: UITableViewCell {

    public func loadImage(from url: URL) {
        let session = URLSession(configuration: .default)

        let task = session.dataTask(with: url) {
            [unowned self] (data: Data?, response, error) in
            if let imageData = data {
                let receivedImage = UIImage.init(data: imageData)
                DispatchQueue.main.async { [unowned self] in
                    self.imageView?.image = receivedImage
                }
            }
        }

        task.resume()
    }
}
