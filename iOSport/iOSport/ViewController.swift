//
//  ViewController.swift
//  iOSport
//
//  Created by etudiant on 14/05/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    struct Keys {
        static let dips = "dips"
        static let pompe = "pompe"
        static let abdo = "abdo"
        static let squat = "squat"
        static let traction = "traction"
    }
    
    struct Experience {
        static let dips = 3
        static let pompe = 2
        static let abdo = 1
        static let squat = 2
        static let traction = 4
    }
    
    var xpForLevel: [Int] = [Int](repeating: 1, count:50)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for i in stride(from: 0, to: xpForLevel.count, by: 1) {
            xpForLevel[i] = xpForLevel[i] * Int(100 + (Float(i) / 2)) * (i + 1) * 2
        }
        
        let defaults : UserDefaults = UserDefaults.standard
        
        let keys = Keys()
        let mirror = Mirror(reflecting: keys)
        
        
        var total: Int = 0
        for child in mirror.children {
            total += defaults.integer(forKey: child.value as! String)
            
            
        }
        
        print("total: " + String(total))
    }
}

