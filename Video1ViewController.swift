//
//  Video1ViewController.swift
//  
//
//  Created by DVT on 27/03/17.
//
//

import UIKit

class Video1ViewController: UIViewController {

    @IBOutlet weak var VideoWebView: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        checkReachability()
        let url = URL(string: "https://firebasestorage.googleapis.com/v0/b/vpmp-polytechnic-fac8c.appspot.com/o/Video%20Lecture%2FIntroduction%20To%20Swift%20Tutorial_HD.mp4?alt=media&token=497e901b-6323-4c65-8566-f7b0d737a65e")
        
        VideoWebView.loadRequest(URLRequest(url: url!))

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func checkReachability(){
        if currentReachabilityStatus == .reachableViaWiFi {
            print("User is connected to the internet via wifi.")
        }else if currentReachabilityStatus == .reachableViaWWAN{
            print("User is connected to the internet via WWAN.")
        } else {
            createAlert(title: "Warning", message: "Unable To Load Video Please Check Your In ternet Connection")
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
