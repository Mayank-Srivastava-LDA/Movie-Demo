//
//  UIImageView+URL.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 29/12/20.
//  Copyright © 2020 Mayank Inc. All rights reserved.
//

import UIKit
import Nuke

//MARK:- To load a image asynchronously
extension UIImageView {
    func load(url: URL) {
        let options = ImageLoadingOptions(placeholder: #imageLiteral(resourceName: "placeholder"),
                                          failureImage: #imageLiteral(resourceName: "placeholder"))
        Nuke.loadImage(with: url, options: options, into: self)
    }
}
