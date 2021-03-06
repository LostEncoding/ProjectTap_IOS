//
//  Enemy.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy : SKSpriteNode {
    let rectSize : CGSize = CGSize(width: 32, height: 32)
    
    init(point : CGPoint, imageName : String){
        let sprite = SKTexture(imageNamed:imageName)
        super.init(texture: sprite, color: SKColor.clearColor(), size: rectSize)
        name = "NPC"
        position = point
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: size.width, height: size.height))
        physicsBody?.dynamic = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func update(time : Int){
        var mult_t = CGFloat(time)/1000
        mult_t += 1
        mult_t *= -100
        physicsBody?.velocity = CGVectorMake(CGFloat(mult_t), 0)
        println(mult_t)
    }
    
    func setLocation(point : CGPoint){
        position = point
    }
}