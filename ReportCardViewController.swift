//
//  ReportCardViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 03/04/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ReportCardViewController: UIViewController {
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser

    @IBOutlet weak var WebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let mail = user?.email
        let docRef = db.collection("profileData").document(mail!)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let urlString = document.get("reportCard")
                let url = URL(string: urlString as! String)
                self.WebView.loadRequest(URLRequest(url: url!))
            } else {
                self.createAlert(title: "404", message: "Data Not Found")
            }
        }
        checkReachability()
    }
    
    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
        }else if currentReachabilityStatus == .reachableViaWWAN{
            print("User is connected to the internet via WWAN.")
        } else {
            createAlert(title: "Warning", message: "Can't Load the Page Please Check Your Internet Connection")
            
        }
    }
    func createAlert (title: String, message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
        self.present(alert, animated: true, completion: nil)
    
}
}
