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
    
    var introStoryLabel = UILabel()
    var startARButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(view.frame)
        createButton()
        createLabel()
        createBackground()
    }
    
    func createLabel(){
        introStoryLabel.frame = CGRect(x: self.view.frame.width * 0.0, y: self.view.frame.height * 0.3, width: 900, height: 300)
        introStoryLabel.text = """
                    There is a family that is going so far, so good... until today.
                    XXX decided what he wanna to study at university and
                    now he'll say it with his father.
        """
        introStoryLabel.font = UIFont(name: "Arial", size: 30)
        introStoryLabel.numberOfLines = 3
        introStoryLabel.textAlignment = .center
        self.view.addSubview(introStoryLabel)
    }
    
    func createButton(){
        startARButton.backgroundColor = .blue
        startARButton.setTitle("Start", for: .normal)
        startARButton.titleLabel?.font = UIFont(name: "Arial", size: 45)
        startARButton.setTitleColor(.white, for: .normal)
        startARButton.frame = CGRect(x: self.view.frame.width * 0.45, y: self.view.frame.height * 0.75, width: 140, height: 100)
        startARButton.addTarget(self, action: #selector(startAR), for: .touchUpInside)
        self.view.addSubview(startARButton)
    }
    
    func createBackground(){
        self.view.backgroundColor = .lightGray
    }
    
    @objc func startAR(){
        let nextViewController = ViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
}
