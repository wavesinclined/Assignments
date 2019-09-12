//
//  Fonts.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 11/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

enum Fonts: String {
    case helvetica = "Helvetica"
    case helveticaBold = "Helvetica-Bold"
}

extension Fonts {
    func of(_ size: CGFloat) -> UIFont {
        return UIFont(name: self.rawValue, size: size)!
    }
}

