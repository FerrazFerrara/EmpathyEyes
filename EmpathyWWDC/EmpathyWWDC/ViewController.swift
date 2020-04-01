//
//  ViewController.swift
//  EmpathyWWDC
//
//  Created by Ferraz on 25/03/20.
//  Copyright © 2020 Ferraz. All rights reserved.
//

import UIKit
import RealityKit
import SpriteKit

class ViewController: UIViewController {
    
    var arView: ARView!
    var filterView = UIView()
    
    var buttonSon = UIButton()
    var buttonFather = UIButton()
    var buttonNutro = UIButton()
    var buttonNext = UIButton()
    var boxAnchor: Experience.Box!
    
    var arrayActionsSon = [Experience.NotificationTrigger]()
    var arrayActionsFather = [Experience.NotificationTrigger]()
    var arrayActionsNeutro = [Experience.NotificationTrigger]()
    var arrayActionsNext = [Experience.NotificationTrigger]()
    
    var actualScene = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createARView()
        filterView = UIView(frame: arView.frame)
        filterView.layer.zPosition = 0
        
        boxAnchor = try! Experience.loadBox()
        
        createButtons()
        createArray()
        
        arView.scene.anchors.append(boxAnchor)
        print("5")
    }
    
    func createARView(){
        print("1")
        arView = ARView(frame: CGRect(x: 0, y: 0, width: 1024, height: 1366))
        self.view = arView
        print("2")
    }
    
    func createButtons(){
        print("3")
        buttonSon.backgroundColor = .blue
        buttonSon.setTitle("filho", for: .normal)
        buttonSon.titleLabel?.font = UIFont(name: "Arial", size: 45)
        buttonSon.setTitleColor(.white, for: .normal)
        buttonSon.frame = CGRect(x: arView.frame.width * 0.1, y: arView.frame.height * 0.85, width: 140, height: 100)
        buttonSon.addTarget(self, action: #selector(buttonSonAction), for: .touchUpInside)
        buttonSon.layer.zPosition = 1
        arView.addSubview(buttonSon)
        
        buttonFather.backgroundColor = .blue
        buttonFather.setTitle("pai", for: .normal)
        buttonFather.titleLabel?.font = UIFont(name: "Arial", size: 45)
        buttonFather.setTitleColor(.white, for: .normal)
        buttonFather.frame = CGRect(x: arView.frame.width * 0.3, y: arView.frame.height * 0.85, width: 140, height: 100)
        buttonFather.addTarget(self, action: #selector(buttonFatherAction), for: .touchUpInside)
        buttonFather.layer.zPosition = 1
        arView.addSubview(buttonFather)
        
        buttonNutro.backgroundColor = .blue
        buttonNutro.setTitle("neutro", for: .normal)
        buttonNutro.titleLabel?.font = UIFont(name: "Arial", size: 45)
        buttonNutro.setTitleColor(.white, for: .normal)
        buttonNutro.frame = CGRect(x: arView.frame.width * 0.5, y: arView.frame.height * 0.85, width: 140, height: 100)
        buttonNutro.addTarget(self, action: #selector(buttonNeutroAction), for: .touchUpInside)
        buttonNutro.layer.zPosition = 1
        arView.addSubview(buttonNutro)
        
        buttonNext.backgroundColor = .blue
        buttonNext.setTitle("next", for: .normal)
        buttonNext.titleLabel?.font = UIFont(name: "Arial", size: 45)
        buttonNext.setTitleColor(.white, for: .normal)
        buttonNext.frame = CGRect(x: arView.frame.width * 0.7, y: arView.frame.height * 0.85, width: 140, height: 100)
        buttonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
        buttonNext.layer.zPosition = 1
        arView.addSubview(buttonNext)
    }
    
    func createArray(){
        print("4")
        arrayActionsSon.append(boxAnchor.notifications.sonScene1)
        arrayActionsSon.append(boxAnchor.notifications.sonScene2)
        arrayActionsSon.append(boxAnchor.notifications.sonScene3)
        arrayActionsSon.append(boxAnchor.notifications.sonScene4)
        arrayActionsSon.append(boxAnchor.notifications.sonScene5)
        arrayActionsSon.append(boxAnchor.notifications.sonScene6)
        
        arrayActionsFather.append(boxAnchor.notifications.fatherScene1)
        arrayActionsFather.append(boxAnchor.notifications.fatherScene2)
        arrayActionsFather.append(boxAnchor.notifications.fatherScene3)
        arrayActionsFather.append(boxAnchor.notifications.fatherScene4)
        arrayActionsFather.append(boxAnchor.notifications.fatherScene5)
        arrayActionsFather.append(boxAnchor.notifications.fatherScene6)
        
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene1)
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene2)
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene3)
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene4)
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene5)
        arrayActionsNeutro.append(boxAnchor.notifications.neutralScene6)
        
        arrayActionsNext.append(boxAnchor.notifications.restartScene2)
        arrayActionsNext.append(boxAnchor.notifications.restartScene3)
        arrayActionsNext.append(boxAnchor.notifications.restartScene4)
        arrayActionsNext.append(boxAnchor.notifications.restartScene5)
        arrayActionsNext.append(boxAnchor.notifications.restartScene6)
    }
    
    @objc func buttonSonAction(){
        print("filho")
        changeWords(notifications: arrayActionsSon)
    }
    
    @objc func buttonFatherAction(){
        print("pai")
        changeWords(notifications: arrayActionsFather)
    }
    
    @objc func buttonNeutroAction(){
        print("neutro")
        changeWords(notifications: arrayActionsNeutro)
    }
    
    @objc func buttonNextAction(){
        print("next")
        if actualScene < 6{
            changeWords(notifications: arrayActionsNext)
            actualScene += 1
        } else{
            passToFinalScreen()
        }
    }
    
    func changeWords(notifications: [Experience.NotificationTrigger]){
        notifications[actualScene - 1].post()
    }
    
    func passToFinalScreen(){
        let nextViewController = FinalMensageViewController()
        nextViewController.modalPresentationStyle = .fullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
}
