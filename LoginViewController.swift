//
//  LoginViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 19/02/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    
    let netwoekingService = NetworkingService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkReachability()

        // Do any additional setup after loading the view.
    }

    @IBAction func unwindToLogIN (Storyboard : UIStoryboardSegue){
        
    }
    
    

    @IBAction func loginAction(_ sender: Any) {
        
        let vcsu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Home")

        
        func signIn(email: String, password: String){
            
            Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil {
                   
                        
                       
                        self.present(vcsu, animated: true, completion: nil)

                        
                    
                    
                }else{
                    print(error!.localizedDescription)
                    self.createAlert(title: "Message", message: "Please, Enter Correct E-mail or Password and All Fields Are Required")
                }
            })
        }
 signIn(email: emailTextField.text!, password: PasswordTextField.text!)
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
