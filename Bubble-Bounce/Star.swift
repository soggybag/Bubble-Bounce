//
//  Star.swift
//  Bubble-Bounce
//
//  Created by mitchell hudson on 4/14/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit

class Star: SKSpriteNode {
    init() {
        
        let texture = SKTexture(imageNamed: "Star")
        let color = UIColor.clear
        let size = texture.size()
        
        super.init(texture: texture, color: color, size: size)

        physicsBody = SKPhysicsBody(circleOfRadius: (size.width / 2) - 5)
        physicsBody?.mass = 10 // ???
        physicsBody?.friction = 0
        physicsBody?.restitution = 1
        physicsBody?.categoryBitMask = PhysicsCategories.STAR
        physicsBody?.collisionBitMask = PhysicsCategories.BUBBLE
        physicsBody?.contactTestBitMask = PhysicsCategories.TARGET
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
