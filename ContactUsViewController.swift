//
//  ContactUsViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 27/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class ContactUsViewController: UIViewController , UITextFieldDelegate {

    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var Submitbutton: UIButton!
    @IBOutlet weak var Emailtextfield: UITextField!
    @IBOutlet weak var YournameTextField: UITextField!
    var ref: DocumentReference? = nil
    let db = Firestore.firestore()

    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        self.Emailtextfield.delegate = self
        self.YournameTextField.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func SubmitButtonAction(_ sender: Any) {
        
    if (Emailtextfield.text?.isEmpty == true || YournameTextField.text?.isEmpty == true)
    {
        createAlert(title: "Message", message: "All Fields Are Required")
        
        }
    else{
        ref = db.collection("contactUs").addDocument(data: [
            "email": Emailtextfield.text!,
            "name": YournameTextField.text!,
            "message": messageTextField.text!
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(self.ref!.documentID)")
                self.createAlert(title: "Message", message: "Your Feedback is sent Succuessfully ! We will Contact You Shortly")
            }
        }


        
        }
    
    
    }
    
    func createAlert (title: String, message : String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.destructive, handler: { (action) in
            
            alert.dismiss(animated: true, completion: nil)
            
        }))
            self.present(alert, animated: true, completion: nil)

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
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
    }
}
