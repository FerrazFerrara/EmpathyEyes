//
//  ButtonCustomAnimation.swift
//  EmpathyWWDC
//
//  Created by Ferraz on 03/04/20.
//  Copyright © 2020 Ferraz. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    func shake(){
        let shake = CABasicAnimation(keyPath: "position")
        
        shake.duration = 0.2
        shake.repeatCount = 2
        shake.autoreverses = true
        
        let fromPoint = CGPoint(x: self.center.x - 5, y: self.center.y)
        let toPoint = CGPoint(x: self.center.x + 5, y: self.center.y)
        
        shake.fromValue = NSValue(cgPoint: fromPoint)
        shake.toValue = NSValue(cgPoint: toPoint)
        
        layer.add(shake, forKey: nil)
    }
}
