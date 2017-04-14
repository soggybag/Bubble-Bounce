//
//  PhysicsCategories.swift
//  Bubble-Bounce
//
//  Created by mitchell hudson on 4/14/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit

struct PhysicsCategories {
    static let NONE: UInt32     = 0         // 0000000
    static let STAR: UInt32     = 0b1       // 0000001
    static let BUBBLE: UInt32   = 0b10      // 0000010
    static let TARGET: UInt32   = 0b100     // 0000100
}
