//
//  Userinfo.swift
//  VPMP Polytechnic
//
//  Created by DVT on 26/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

struct User {
    
    var username: String!
    var email: String!
    var photoUrl: String!
    var ref: DatabaseReference!
    var key: String
    
    init(snapshot: DataSnapshot){
        
        key = snapshot.key
        username = (snapshot.value as? NSDictionary)?["username"] as? String
        email = (snapshot.value as? NSDictionary)?["email"] as? String
        photoUrl = (snapshot.value as? NSDictionary)?["photoUrl"] as? String
        ref = snapshot.ref
        
        
        
        
    }
    
}
