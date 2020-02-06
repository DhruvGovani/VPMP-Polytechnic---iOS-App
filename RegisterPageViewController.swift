//
//  RegisterPageViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 23/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseDatabase

class RegisterPageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    @IBOutlet weak var UsernameTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var EnrollmentNoTextField: UITextField!
    @IBOutlet weak var UserImageView: UIImageView!
    let networkingService = NetworkingService()
    var databaseRef : DatabaseReference!{
        return Database.database().reference()
    }
    var sttorageRef : StorageReference!{
        return Storage.storage().reference()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        
        //Hide keyboard on touch
        self.UsernameTextField.delegate = self
        self.PasswordTextField.delegate = self
        self.UsernameTextField.delegate = self

        // Do any additional setup after loading the view.
    }
   
    @IBAction func SignUpAction(_ sender: AnyObject) {
        
        signUp(email: EnrollmentNoTextField.text!, Username: UsernameTextField.text!, password: PasswordTextField.text!)
        
                
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
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
    func  signUp(email : String ,Username: String ,password : String){
        
        
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            
            if error == nil {
                
                self.createAlert(title: "Messge", message: "Your Account Has Been Created ! Please log in To Get Procced")
                
            }else{
                
              
                self.createAlert(title: "Messge", message: error!.localizedDescription)
                
                
            }
        })
        
    }
    
}
