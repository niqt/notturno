//
//  MapViewController.swift
//  CoreDataNotturno
//
//  Created by Nicola De FIlippo on 16/10/2019.
//  Copyright © 2019 Nicola De FIlippo. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    @IBOutlet weak var mapView: MKMapView!
    var indirizzo: String  = "Benevento corso garibaldi 1"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let geoCoder = CLGeocoder()
        geoCoder.geocodeAddressString("Benevento corso garibaldi 1", completionHandler: { placemarks, error in
            if let error = error {
                print(error)
                return
            }
        if let placemarks = placemarks {
            // Get the first placemark
            let placemark = placemarks[0]
            // Add annotation
            let annotation = MKPointAnnotation()
            annotation.title = "Foundation"
            annotation.subtitle = "Ristorante a base di bit"
            if let location = placemark.location {
                annotation.coordinate = location.coordinate
                // Display the annotation
                self.mapView.showAnnotations([annotation], animated: true)
                self.mapView.selectAnnotation(annotation, animated: true)
                
                // Set the zoom level
                let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 250, longitudinalMeters: 250)
                self.mapView.setRegion(region, animated: false)
            }
        }
        })
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
