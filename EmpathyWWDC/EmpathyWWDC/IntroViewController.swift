//
//  IntroViewController.swift
//  EmpathyWWDC
//
//  Created by Ferraz on 30/03/20.
//  Copyright © 2020 Ferraz. All rights reserved.
//

import Foundation
import UIKit

class IntroViewController: UIViewController{
    
    var backgroundView = UIImageView()
    var startARButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createBackground()
    }
    
    func createButton(){
        startARButton.setBackgroundImage(UIImage(named: "botaoStartAR"), for: .normal)
        startARButton.frame = CGRect(x: self.view.frame.width * 0.45, y: self.view.frame.height * 0.75, width: 454, height: 157)
        startARButton.center.x = self.view.center.x
        startARButton.addTarget(self, action: #selector(startAR), for: .touchUpInside)
        self.view.addSubview(startARButton)
    }
    
    func createBackground(){
        let backgroundImage = UIImage(named: "telaIntro")
        backgroundView = UIImageView(image: backgroundImage)
        backgroundView.center = self.view.center
        backgroundView.layer.zPosition = -1
        self.view.addSubview(backgroundView)
    }
    
    @objc func startAR(){
        let nextViewController = ViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
