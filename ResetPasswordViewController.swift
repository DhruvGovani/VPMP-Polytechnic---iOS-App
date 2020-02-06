//
//  ResetPasswordViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 19/02/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ResetPasswordViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var EmailTextField: UITextField!
    
    let networkingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ResetPasswordAction(_ sender: Any) {
        
        
        resetPassword(email:EmailTextField.text!)

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
    
    func resetPassword(email: String){
        
        Auth.auth().sendPasswordReset(withEmail: email, completion: { (error) in
            
            if error == nil{
                
                self.createAlert(title: "Message", message: "An E-mail With Reset Password Link Has been sent to Your E-mail ID")
                
                print("an Email with information on how is reset you password has been sent to your mail")
                
            }else{
                self.createAlert(title: "Message", message: "Please Enter Valid E-mail")
                print(error!.localizedDescription)
            }
            
        })
        
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
    }
}
