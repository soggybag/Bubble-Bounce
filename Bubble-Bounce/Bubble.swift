//
//  Bubble.swift
//  Bubble-Bounce
//
//  Created by mitchell hudson on 4/14/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit

class Bubble: SKShapeNode {
    
    override init() {
        
        super.init()
        
        let circle = UIBezierPath(arcCenter: CGPoint.zero, radius: 60, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        self.path = circle.cgPath
        self.strokeColor = UIColor(white: 1, alpha: 0.5)
        self.lineWidth = 6
        self.fillColor = UIColor(white: 1, alpha: 0.25)
        
        physicsBody = SKPhysicsBody(circleOfRadius: 60)
        physicsBody?.isDynamic = false
        physicsBody?.categoryBitMask = PhysicsCategories.BUBBLE
        physicsBody?.collisionBitMask = PhysicsCategories.STAR
        physicsBody?.contactTestBitMask = PhysicsCategories.NONE
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
