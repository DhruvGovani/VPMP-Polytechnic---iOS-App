//
//  CoustomImageView.swift
//  VPMP Polytechnic
//
//  Created by DVT on 20/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit

@IBDesignable class CoustomImageView: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        
        didSet{
            
            layer.cornerRadius = cornerRadius
         
        }
    }
    
    @IBInspectable var BorderWidth : CGFloat = 0{
        
        didSet{
            
            layer.borderWidth = BorderWidth
        }
        
    }
    

}
