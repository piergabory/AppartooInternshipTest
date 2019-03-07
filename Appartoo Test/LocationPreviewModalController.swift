//
//  LocationPreviewModalController.swift
//  Appartoo Test
//
//  Created by Pierre Gabory on 07/03/2019.
//  Copyright © 2019 Pierre Gabory. All rights reserved.
//

import UIKit
import MapKit

class LocationPreviewModalController: UIViewController, MKMapViewDelegate {

    var specificBarToShow: Bar? = nil

    @IBOutlet weak var mapView: MKMapView!


    override func viewDidLoad() {
        super.viewDidLoad()

        mapView.delegate = self
        mapView.showsUserLocation = true
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2DMake(specificBarToShow!.coordinates.latitude, specificBarToShow!.coordinates.longitude)

        // centrer la carte sur Paris
        mapView.setRegion(MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000), animated: true)
        mapView.addAnnotation(annotation)
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        return MKPinAnnotationView()
    }

    
    @IBAction func dismissModal(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
