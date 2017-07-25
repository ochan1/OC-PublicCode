//
//  UIImage+Size.swift
//  Makestagram
//
//  Created by Oscar Chan on 7/5/17.
//  Copyright © 2017 Oscar Chan. All rights reserved.
//

import UIKit

extension UIImage {
    var aspectHeight: CGFloat {
        let heightRatio = size.height / 736
        let widthRatio = size.width / 414
        let aspectRatio = fmax(heightRatio, widthRatio)
        
        return size.height / aspectRatio
    }
}
