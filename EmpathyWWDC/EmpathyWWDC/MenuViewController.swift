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
    var sceneTitle = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame)
        createLabel()
        createButton()
        createBackGround()
    }
    
    func createButton(){
        startButton.backgroundColor = .blue
        startButton.setTitle("Start", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Arial", size: 45)
        startButton.setTitleColor(.white, for: .normal)
        startButton.frame = CGRect(x: self.view.frame.width * 0.5, y: self.view.frame.height * 0.75, width: 140, height: 100)
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    func createLabel(){
        sceneTitle.frame = CGRect(x: self.view.frame.width * 0.5, y: self.view.frame.height * 0.25, width: 300, height: 100)
        sceneTitle.text = "Empathy Eyes"
        sceneTitle.textAlignment = .center
        self.view.addSubview(sceneTitle)
    }
    
    func createBackGround(){
        self.view.backgroundColor = .lightGray
    }
    
    @objc func startButtonAction(){
        let nextViewController = IntroViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
