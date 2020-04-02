//
//  FinalMensageViewController.swift
//  EmpathyWWDC
//
//  Created by Ferraz on 30/03/20.
//  Copyright © 2020 Ferraz. All rights reserved.
//

import Foundation
import UIKit

class FinalMensageViewController: UIViewController{
    
    var backgroundView = UIImageView()
    var restartButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createBackground()
    }
    
    func createButton(){
        restartButton.setBackgroundImage(UIImage(named: "botaoMenu"), for: .normal)
        restartButton.frame = CGRect(x: self.view.frame.width * 0.45, y: self.view.frame.height * 0.75, width: 348, height: 141)
        restartButton.center.x = self.view.center.x
        restartButton.addTarget(self, action: #selector(startAR), for: .touchUpInside)
        self.view.addSubview(restartButton)
    }
    
    func createBackground(){
        let backgroundImage = UIImage(named: "telaFinal")
        backgroundView = UIImageView(image: backgroundImage)
        backgroundView.center = self.view.center
        backgroundView.layer.zPosition = -1
        self.view.addSubview(backgroundView)
    }
    
    @objc func startAR(){
        let nextViewController = MenuViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
