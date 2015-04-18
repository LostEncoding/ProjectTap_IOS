//
//  GameScene.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let player = Player(point: CGPoint(x: 50, y: 300))
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        addPlayer()
        addSprite(Ground(rect: CGRectMake(0, 200, 1000, 10)))
        addSprite(Enemy(point: CGPoint(x: 400, y: 21), imageName: "car"))
        loadGame()
    }
    
    override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
        player.tapAction()
    }
    
//    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
//        player.tapAction()
//        for touch: AnyObject in touches {
//            
//        }
//    }
    
    override func update(currentTime: CFTimeInterval) {
        
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
    }
}
