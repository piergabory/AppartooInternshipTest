//
//  SecondViewController.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate {

    let data = BarJsonData()

    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self

        mapView.showsUserLocation = true

        // centrer la carte sur Paris
        mapView.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2DMake(48.8566, 2.3488), latitudinalMeters: 10000, longitudinalMeters: 10000), animated: true)

        let dropPins: Array<MKPointAnnotation>  = data.bars.map { (bar: Bar) in
            let coordinates = CLLocationCoordinate2DMake(bar.coordinates.latitude, bar.coordinates.longitude)
            let annotation = MKPointAnnotation()

            annotation.coordinate = coordinates

            return annotation
        }
        mapView.addAnnotations(dropPins)

    }

}

