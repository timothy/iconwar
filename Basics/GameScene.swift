//
//  GameScene.swift
//  Basics
//
//  Created by Esther on 2/16/19.
//  Copyright © 2019 bib. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var player: SKSpriteNode?
    var fireRate: TimeInterval = 0.5
    var timeSinceFire:TimeInterval = 0
    var lastTime: TimeInterval = 0
    

    override func didMove(to view: SKView) {
//        let myShip: SKSpriteNode = self.childNode(withName: "ship") as! SKSpriteNode
//        myShip.xScale = 0.25
//        myShip.yScale = 0.25
        
//        let player: SKSpriteNode = SKSpriteNode(imageNamed: "player")
//        player.position = CGPoint(x: 0, y: 223)
//        player.xScale = 0.25
//        player.yScale = 0.25
        player = self.childNode(withName: "ship") as? SKSpriteNode
        
        //self.addChild(player)
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        checkLaser(frameRate: currentTime - lastTime)
        lastTime = currentTime
    }
    
    func checkLaser(frameRate:TimeInterval){
        
        timeSinceFire += frameRate
        
        if timeSinceFire < fireRate {
            return
        }
        
        spawnLaser()
        timeSinceFire = 0
    }
    
    func spawnLaser() {
        let scene:SKScene = SKScene(fileNamed: "Laser")!
        let laser = scene.childNode(withName: "laser")
        laser?.position = player!.position
        laser?.move(toParent: self)
        
        //let laserColor = UIColor(displayP3Red: 50 / 255.0, green: 180/255.0, blue: 240 / 255.0, alpha: 1.0)
        //SKSpriteNode(color: laserColor, size: CGSize(width: 7, height: 21))
        //self.addChild(laser)
//        laser.physicsBody?.isDynamic = true
//        laser.physicsBody?.allowsRotation = true
//        laser.physicsBody?.affectedByGravity = true
//        laser.physicsBody?.friction = 0.2
//        laser.physicsBody?.restitution = 0.2
//        laser.physicsBody?.angularDamping = 0.2
//        laser.physicsBody?.mass = 0.006
//        laser.physicsBody?.linearDamping = 0
//        laser.physicsBody?.velocity = CGVector(dx: 0, dy: 500)
        
    }
}
