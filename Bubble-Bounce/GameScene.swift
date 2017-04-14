//
//  GameScene.swift
//  Bubble-Bounce
//
//  Created by mitchell hudson on 4/14/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var stars = [Star]()
    var targets = [Target]()
    
    func makeTargetAt(point: CGPoint) {
        let target = Target()
        targets.append(target)
        
        target.position = point
        
        addChild(target)
        
        print(target.position)
        
        let h = view!.bounds.height
        let move = SKAction.moveBy(x: 0, y: -h - 200, duration: 5)
        let seq = SKAction.sequence([move, SKAction.removeFromParent()])
        target.run(seq)
    }
    
    func makeTargets() {
        let w = view!.bounds.width
        let h = view!.bounds.height
        let range = w - 80
        
        let make = SKAction.run {
            let x = CGFloat(arc4random() % UInt32(range)) + 40
            let y = CGFloat(arc4random() % 150) + 40 + h
            self.makeTargetAt(point: CGPoint(x: x, y: y))
        }
        
        let wait = SKAction.wait(forDuration: 2.234)
        let seq = SKAction.sequence([wait, make])
        let rep = SKAction.repeatForever(seq)
        run(rep)
    }
    
    func makeStarAt(point: CGPoint) {
        let star = Star()
        stars.append(star)
        
        addChild(star)
        
        star.position = point
    }
    
    func makeStars() {
        let w = view!.bounds.width
        let h = view!.bounds.height
        let range = w - 80
        
        let makeStarAction = SKAction.run {
            let x = CGFloat(arc4random() % UInt32(range)) + 40
            let y = CGFloat(arc4random() % 150) + 40 + h
            self.makeStarAt(point: CGPoint(x: x, y: y))
        }
        let wait = SKAction.wait(forDuration: 1)
        let seq = SKAction.sequence([wait, makeStarAction])
        let repeatAction = SKAction.repeatForever(seq)
        self.run(repeatAction)
    }
    
    func makeBubble() {
        let bubble = Bubble()
        bubble.position.x = view!.bounds.width / 2
        bubble.position.y = 100
        addChild(bubble)
    }
    
    //
    override func didMove(to view: SKView) {
        physicsWorld.gravity = CGVector(dx: 0, dy: -1)
        physicsWorld.contactDelegate = self
        
        makeBubble()
        makeStars()
        makeTargets()
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first!
        let location = touch.location(in: self)
        // TODO: position bubble ??
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        // TODO: position bubble ??
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        for star in stars {
            if star.position.y < -40 {
                star.removeFromParent()
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let collision = contact.bodyA.categoryBitMask | contact.bodyB.categoryBitMask
        
        if collision == PhysicsCategories.STAR | PhysicsCategories.TARGET {
            print("Star Hit Target!")
        }
    }
    
}
















