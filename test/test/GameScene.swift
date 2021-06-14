//
//  GameScene.swift
//  test
//
//  Created by Pedro Alejandro on 12/30/20.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    var background = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        addAssets()
        let rectangel = SKShapeNode(rect: self.frame)
        rectangel.strokeColor = .green
        rectangel.lineWidth = 10
        addChild(rectangel)
    }
    
    
    override func sceneDidLoad() {
      

    }
    
    func addAssets() {
        background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: frame.size.width / 2, y: frame.size.height / 2)
        background.scale(to: CGSize(width: frame.size.width, height: frame.size.height))
        background.zPosition = -1
        self.addChild(background)
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    
    }
}
