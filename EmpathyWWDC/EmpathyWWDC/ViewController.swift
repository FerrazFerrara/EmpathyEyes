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
        arView = ARView(frame: CGRect(x: 0, y: 0, width: 835, height: 1024))
        arView.center = self.view.center
        self.view = arView
        print("2")
    }
    
    func createButtons(){
        print("3")
        buttonSon.setBackgroundImage(UIImage(named: "botaoSonDes"), for: .normal)
        buttonSon.setBackgroundImage(UIImage(named: "botaoSonAtivado"), for: .disabled)
        buttonSon.isEnabled = true
        buttonSon.frame = CGRect(x: arView.frame.width * 0.355, y: arView.frame.height * 0.7, width: 230, height: 127)
        buttonSon.addTarget(self, action: #selector(buttonSonAction), for: .touchUpInside)
        buttonSon.layer.zPosition = 1
        arView.addSubview(buttonSon)
        
        
        buttonNutro.setBackgroundImage(UIImage(named: "botaoNeutralDes"), for: .normal)
        buttonNutro.setBackgroundImage(UIImage(named: "botaoNeutralAtivado"), for: .disabled)
        buttonNutro.isEnabled = false
        buttonNutro.frame = CGRect(x: arView.frame.width * 0.5, y: arView.frame.height * 0.7, width: 230, height: 127)
        buttonNutro.center.x = self.arView.center.x
        buttonNutro.addTarget(self, action: #selector(buttonNeutroAction), for: .touchUpInside)
        buttonNutro.layer.zPosition = 1
        arView.addSubview(buttonNutro)
        
        
        buttonFather.setBackgroundImage(UIImage(named: "botaoFatherDes"), for: .normal)
        buttonFather.setBackgroundImage(UIImage(named: "botaoFatherAtivado"), for: .disabled)
        buttonFather.isEnabled = true
        buttonFather.frame = CGRect(x: arView.frame.width, y: arView.frame.height * 0.7, width: 230, height: 127)
        buttonFather.addTarget(self, action: #selector(buttonFatherAction), for: .touchUpInside)
        buttonFather.layer.zPosition = 1
        arView.addSubview(buttonFather)
        

        buttonNext.setBackgroundImage(UIImage(named: "botaoNext"), for: .normal)
        buttonNext.frame = CGRect(x: arView.frame.width * 0.8, y: arView.frame.height * 0.85, width: 402, height: 122)
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
        buttonSon.isEnabled = false
        buttonNutro.isEnabled = true
        buttonFather.isEnabled = true
        changeWords(notifications: arrayActionsSon)
    }
    
    @objc func buttonFatherAction(){
        buttonSon.isEnabled = true
        buttonNutro.isEnabled = true
        buttonFather.isEnabled = false
        print("pai")
        changeWords(notifications: arrayActionsFather)
    }
    
    @objc func buttonNeutroAction(){
        buttonSon.isEnabled = true
        buttonNutro.isEnabled = false
        buttonFather.isEnabled = true
        print("neutro")
        changeWords(notifications: arrayActionsNeutro)
    }
    
    @objc func buttonNextAction(){
        print("next")
        if actualScene < 6{
            buttonSon.isEnabled = true
            buttonNutro.isEnabled = false
            buttonFather.isEnabled = true
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
