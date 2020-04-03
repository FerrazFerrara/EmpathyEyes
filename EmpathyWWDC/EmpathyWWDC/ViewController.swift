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
import ARKit

class ViewController: UIViewController {
    
    /// ar view for the scene
    var arView: ARView!
    /// view for create a fake camera filter
    var filterView = UIView()
    
    /// outlet button for son vision
    var buttonSon = UIButton()
    /// outlet button for father vision
    var buttonFather = UIButton()
    /// outlet button for neutral vision
    var buttonNutro = UIButton()
    /// outlet button for next speech
    var buttonNext = UIButton()
    /// outlet label for explain
    var labelChoose = UILabel()
    /// ar scene anchor
    var boxAnchor: Experience.Box!
    
    /// array of actions from son
    var arrayActionsSon = [Experience.NotificationTrigger]()
    /// array of actions from father
    var arrayActionsFather = [Experience.NotificationTrigger]()
    /// array of actions from neutral
    var arrayActionsNeutro = [Experience.NotificationTrigger]()
    /// array of actions to pass speech
    var arrayActionsNext = [Experience.NotificationTrigger]()
    
    var actualScene = 1
    var fatherVisionSeen = false
    var sonVisionSeen = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createARView()
        configAR()
        print("5")
    }
    
    func createARView(){
        print("1")
        arView = ARView(frame: CGRect(x: 0, y: 0, width: 835, height: 1024))
        arView.center = self.view.center
        self.view = arView
        print("2")
    }
    
    func createLabel(){
        labelChoose.text = "Choose your vision"
        labelChoose.frame = CGRect(x: arView.frame.width * 0.5, y: arView.frame.height * 0.61, width: 300, height: 100)
        labelChoose.center.x = self.view.center.x
        labelChoose.font = UIFont(name: "Arial", size: 30)
        labelChoose.textAlignment = .center
        arView.addSubview(labelChoose)
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
        if sonVisionSeen && fatherVisionSeen{
            if actualScene < 6{
                buttonSon.isEnabled = true
                buttonNutro.isEnabled = false
                buttonFather.isEnabled = true
                changeWords(notifications: arrayActionsNext)
                actualScene += 1
            } else{
                passToFinalScreen()
            }
        } else {
            buttonNext.shake()
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
    
    func configAR(){
        let config = ARWorldTrackingConfiguration()
        config.planeDetection = .horizontal
        arView.session.run(config, options: [])
        
        coachConfig()
    }
}

extension ViewController: ARCoachingOverlayViewDelegate{
    func coachConfig(){
        let coaching = ARCoachingOverlayView()
        coaching.delegate = self
        coaching.session = self.arView.session
        coaching.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        coaching.goal = .horizontalPlane
        coaching.frame.origin.y = self.view.bounds.height/2
        coaching.frame.origin.x = self.view.bounds.width/2
        
        self.arView.addSubview(coaching)
    }
    
    func coachingOverlayViewDidDeactivate(_ coachingOverlayView: ARCoachingOverlayView) {
        coachingOverlayView.activatesAutomatically = false
        boxAnchor = try! Experience.loadBox()
        arView.scene.anchors.append(boxAnchor)
        
        createLabel()
        createButtons()
        createArray()
    }
}
