//
//  LocateUsViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 26/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import MapKit


class LocateUsViewController: UIViewController {

    @IBOutlet weak var MapWebview: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        openMapForPlace()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "mainUiNavigation")
        
        present(vc,animated: true, completion: nil)
        
    }
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
        }else if currentReachabilityStatus == .reachableViaWWAN{
            print("User is connected to the internet via WWAN.")
        } else {
            createAlert(title: "Warning", message: "Please Check Your Internet Connection")
        }
    }
    func createAlert (title: String, message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    func openMapForPlace() {

            let latitude: CLLocationDegrees = 23.239655
            let longitude: CLLocationDegrees = 72.638442

            let regionDistance:CLLocationDistance = 10000
            let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
        let regionSpan = MKCoordinateRegion(center: coordinates, latitudinalMeters: regionDistance, longitudinalMeters: regionDistance)
            let options = [
                MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
                MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
            ]
            let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
            let mapItem = MKMapItem(placemark: placemark)
            mapItem.name = "VPMP Polytechnics"
            mapItem.openInMaps(launchOptions: options)
        }
    }
    
  

