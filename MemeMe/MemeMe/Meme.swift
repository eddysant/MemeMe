//
//  Meme.swift
//  MemeMe
//
//  Created by Sant, Eddy on 2017-01-10.
//  Copyright © 2017 Eddy Sant. All rights reserved.
//

import Foundation
import UIKit

struct Meme {
    var topText: String!
    var bottomText: String!
    var originalImage: UIImage!
    var memedImage: UIImage!
    
    init(topText: String, bottomText: String, originalImage: UIImage, memedImage: UIImage) {
        self.topText = topText
        self.bottomText = bottomText
        self.originalImage = originalImage
        self.memedImage = memedImage
    }
}
