//
//  Ground.swift
//  LostEncodingTap
//
//  Created by Zach Eriksen on 4/11/15.
//  Copyright (c) 2015 Zach Eriksen. All rights reserved.
//

import Foundation
import SpriteKit

class Ground : SKSpriteNode {
    
    init(rect : CGRect){
        let sprite = SKTexture(imageNamed:"ground")
        super.init(texture: sprite, color: SKColor.brownColor(), size: rect.size)
        position = rect.origin
        name = "Ground"
        physicsBody = SKPhysicsBody(rectangleOfSize: CGSize(width: size.width, height: size.height))
        physicsBody?.dynamic = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLocation(point : CGPoint){
        position = point
    }
}