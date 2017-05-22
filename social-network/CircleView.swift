//
//  CircleView.swift
//  social-network
//
//  Created by r3d on 22/05/2017.
//  Copyright © 2017 Alexandru Corut. All rights reserved.
//

import UIKit

class CircleView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
        clipsToBounds = true
    }

 
}
