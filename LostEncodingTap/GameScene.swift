//
//  GameScene.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    let player = Player(point: CGPoint(x: 400, y: 300))
    let car = Enemy(point: CGPoint(x: 1000, y: 221), imageName: "car")
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        print("load")
        let background = SKSpriteNode(color: SKColor.lightGrayColor(), size: self.size)
        background.lightingBitMask = 1
        background.zPosition = 0
        background.position = CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
        addChild(background)
        
        var light =  SKLightNode()
        light.falloff = 1
        light.categoryBitMask = 1
        light.lightColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.5)
        light.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
        light.ambientColor = UIColor.whiteColor()
        light.position = CGPointMake(700, 700)
        addChild(light)
        addPlayer()
        addSprite(Ground(rect: CGRectMake(0, 200, 2000, 10)))
        addSprite(car)
        loadGame()
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        player.tapAction()
        for touch: AnyObject in touches {
            
        }
    }
    
    override func update(currentTime: CFTimeInterval) {
        super.update(currentTime)
        car.update()
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
