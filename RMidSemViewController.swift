//
//  RMidSemViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 26/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase


class RMidSemViewController: UIViewController {
    
    @IBOutlet weak var EnoTextField: UITextField!
    
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        
        // Do any additional setup after loading the view.
    }

   
    @IBAction func ButtonAction(_ sender: Any) {
        
        let docRef = db.collection("midResult").document(EnoTextField.text!)
        //let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RMid504")
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let property = document.get("url")
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(dataDescription)")
                let midResultVC : RMid504ViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RMid504") as! RMid504ViewController
                midResultVC.urlString = property as! String
                    
                self.present(midResultVC, animated: true, completion: nil)
                
            } else {
                self.createAlert(title: "Error", message: "Please Enter Valid Enrollment Number!")
            }
        }
        
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
    
    @IBAction func unwindToRmidsem (Storyboard : UIStoryboardSegue){
        
    }
}
