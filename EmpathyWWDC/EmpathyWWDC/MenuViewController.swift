//
//  MenuViewController.swift
//  EmpathyWWDC
//
//  Created by Ferraz on 30/03/20.
//  Copyright © 2020 Ferraz. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController{
    
    var startButton = UIButton()
    var backgroundView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createBackGround()
    }
    
    func createButton(){
        startButton.setBackgroundImage(UIImage(named: "botaoStart"), for: .normal)
        startButton.frame.size = CGSize(width: 405, height: 157)
//        startButton.frame = CGRect(x: self.view.frame.width * 0.35, y: self.view.frame.height * 0.75, width: 405, height: 157)
        startButton.center.x = self.view.center.x
        startButton.center.y = self.view.frame.height * 0.75
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    func createBackGround(){
        let backgroundImage = UIImage(named: "telaMenu")
        backgroundView = UIImageView(image: backgroundImage)
        backgroundView.center = self.view.center
        backgroundView.layer.zPosition = -1
        self.view.addSubview(backgroundView)
    }
    
    @objc func startButtonAction(){
        let nextViewController = IntroViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
