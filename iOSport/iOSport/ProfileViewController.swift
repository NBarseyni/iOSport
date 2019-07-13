//
//  ProfileViewController.swift
//  iOSport
//
//  Created by etudiant on 14/05/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var textLevel: UILabel!
    @IBOutlet weak var progressLevel: UIProgressView!
    
    var experience: Programme?
    
    var xpForLevel: [Int] = [Int](repeating: 1, count:50)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in stride(from: 0, to: xpForLevel.count, by: 1) {
            xpForLevel[i] = xpForLevel[i] * Int(100 + (Float(i) / 2)) * (i + 1) * 2
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        experience = Programme.loadExperience()
        
        let userExp : Int = experience!.calculateXp()
        
        var i: Int = 0
        while (xpForLevel[i] < userExp) {
            i += 1
        }
        
        print(userExp)
        print(xpForLevel[i])
        
        progressLevel.progress = Float(userExp) / Float(xpForLevel[i])
        
        textLevel.text = "Level " + String(i)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
