//
//  Player.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import Foundation
import SpriteKit

class Player : SKSpriteNode {
    let rectSize : CGSize = CGSize(width: 32, height: 32)
    var grounded : Bool = true
    init(point  : CGPoint){
        let sprite = SKTexture(imageNamed:"player")
        super.init(texture: sprite, color: SKColor.clearColor(), size: rectSize)
        name = "Player"
        position = point
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: rectSize.width, height: rectSize.height))
        physicsBody?.dynamic = true
        physicsBody?.velocity = CGVectorMake(0, 0)
        physicsBody?.contactTestBitMask = 1
        shadowCastBitMask = 1
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocation(point : CGPoint){
        position = point
    }
    
    func update(){
        if !grounded {
            zRotation = CGFloat(zRotation-0.11)
        }
    }
    
    func tapAction(){
        grounded = false
        physicsBody?.velocity = CGVectorMake(0, 1000)
    }
    
    func onDeath(){
    }
}