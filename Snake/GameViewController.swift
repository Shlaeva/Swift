//
//  GameViewController.swift
//  Snake
//
//  Created by Julie on 15.04.2020.
//  Copyright © 2020 YuliaShlaeva. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let scene = GameScene(size: view.bounds.size)
        let skView = view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            skView.ignoresSiblingOrder = true
        scene.scaleMode = .resizeFill
            
        skView.presentScene(scene)
    }
    
}

