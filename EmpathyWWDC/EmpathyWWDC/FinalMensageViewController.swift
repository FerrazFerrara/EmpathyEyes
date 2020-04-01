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
    
    var finalLabel = UILabel()
    var restartButton = UIButton()
    var text =  """
                Everybody has a different vision of the world,
                We need to be careful about what we hear and what we say
                """
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createButton()
        createLabel()
        createBackground()
    }
    
    func createLabel(){
        finalLabel.frame = CGRect(x: self.view.frame.width * 0.1, y: self.view.frame.height * 0.3, width: 800, height: 300)
        finalLabel.text = text
        finalLabel.font = UIFont(name: "Arial", size: 30)
        finalLabel.numberOfLines = 2
        finalLabel.textAlignment = .center
        self.view.addSubview(finalLabel)
    }
    
    func createButton(){
        restartButton.backgroundColor = .blue
        restartButton.setTitle("Menu", for: .normal)
        restartButton.titleLabel?.font = UIFont(name: "Arial", size: 45)
        restartButton.setTitleColor(.white, for: .normal)
        restartButton.frame = CGRect(x: self.view.frame.width * 0.45, y: self.view.frame.height * 0.75, width: 140, height: 100)
        restartButton.addTarget(self, action: #selector(startAR), for: .touchUpInside)
        self.view.addSubview(restartButton)
    }
    
    func createBackground(){
        self.view.backgroundColor = .lightGray
    }
    
    @objc func startAR(){
        let nextViewController = MenuViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
