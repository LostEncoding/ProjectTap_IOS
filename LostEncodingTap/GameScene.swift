//
//  GameScene.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    let player = Player(point: CGPoint(x: 400, y: 300))
    var sprites : [SKSpriteNode] = []
    let level = [10,100,200,300]
    var tickCount = 0
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        print("load")
        self.physicsWorld.contactDelegate = self
        let background = SKSpriteNode(color: SKColor.lightGrayColor(), size: self.size)
        background.lightingBitMask = 1
        background.zPosition = 0
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        addChild(background)
        addPlayer()
        addChild(Ground(rect: CGRectMake(0, 200, 2500, 10)))
        loadGame()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        player.tapAction()
        for touch: AnyObject in touches {
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        super.update(currentTime)
        tickCount++
        player.update()
        for sprite in sprites {
            (sprite as! Enemy).update(tickCount)
        }
        for npc in level {
            if npc == tickCount {
                addSprite(Enemy(point: CGPoint(x: 1000, y: 221), imageName: "car"))
            }
        }
    }
    
    func loadGame(){
        physicsWorld.gravity = CGVectorMake(0.0, -9.8)
    }
    
    func addLabel(){
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 65;
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        self.addChild(myLabel)
    }
    
    func addPlayer(){
        self.addChild(player)
    }
    
    func addSprite(sprite : SKSpriteNode){
        addChild(sprite)
        sprites.append(sprite)
    }
}

extension GameScene {
    func didBeginContact(contact: SKPhysicsContact) {
        var firstBody = contact.bodyA
        var secondBody = contact.bodyB
        if firstBody.node?.name == "Player"{
            if secondBody.node?.name == "NPC"{
                println("Dead")
            }
            if secondBody.node?.name == "Ground"{
                (firstBody.node as! Player).grounded = true
            }
        }
    }
}
