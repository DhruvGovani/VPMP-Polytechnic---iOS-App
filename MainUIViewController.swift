//
//  MainUIViewController.swift
//  VPMP Polytechnic
//
//  Created by DVT on 22/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MainUIViewController: UIViewController {
 var handle: AuthStateDidChangeListenerHandle?
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        checkSignin()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // [START auth_listener]
    handle = Auth.auth().addStateDidChangeListener { (auth, user) in
      // [START_EXCLUDE]
        print(user as Any)
      
      // [END_EXCLUDE]
        }
        
    }
    override func viewWillDisappear(_ animated: Bool) {
      super.viewWillDisappear(animated)
      // [START remove_auth_listener]
      Auth.auth().removeStateDidChangeListener(handle!)
      // [END remove_auth_listener]
    }
    

    @IBAction func unwindToMainUI (Storyboard : UIStoryboardSegue)
    {
        
    }

    
    @IBAction func LogoutAction(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        print("sign out done!")
        self.goHome()
        
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
    func checkSignin(){
         
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
          if Auth.auth().currentUser != nil {
                print("Ok")
              } else {
                  self.goHome()
              }
          }

        }
    func goHome(){
        let vcsu = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Getstartedviewcontroller")
        self.present(vcsu, animated: true, completion: nil)
    }
       

           

    
}
