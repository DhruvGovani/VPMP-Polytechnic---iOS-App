//
//  CustomizableButton.swift
//  VPMP Polytechnic
//
//  Created by DVT on 22/03/17.
//  Copyright © 2017 DDS Developers. All rights reserved.
//

import UIKit

@IBDesignable class CustomizableButton: UIButton {

    @IBInspectable var cornerRadius : CGFloat = 0 {
    
        didSet{
            
            layer.cornerRadius = cornerRadius
        }
    }
}
