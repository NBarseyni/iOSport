//
//  SingleProgramViewController.swift
//  iOSport
//
//  Created by Anthony Konig on 12/07/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class SingleProgramViewController: UIViewController {

    @IBOutlet weak var textAbdos: UILabel!
    @IBOutlet weak var textDips: UILabel!
    @IBOutlet weak var textPompes: UILabel!
    @IBOutlet weak var textSquats: UILabel!
    @IBOutlet weak var textTractions: UILabel!
    
    
    var program: Programme?
    
    @IBAction func programDone(_ sender: Any) {
        let p = Programme.loadExperience()
        for e in p.exercices {
            for exoDone in program!.exercices {
                if e.type == exoDone.type {
                    e.count += exoDone.count
                    break
                }
            }
        }
        
        p.saveExperience()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = program?.name
        
        for e in program!.exercices {
            switch e.type {
            case .ABDO :
                textAbdos.text = "Abdos : " + String(e.count)
                break
            case .DIP:
                textDips.text = "Dips : " + String(e.count)
                break
            case .POMPE:
                textPompes.text = "Pompes : " + String(e.count)
                break
            case .SQUAT:
                textSquats.text = "Squats : " + String(e.count)
                break
            case .TRACTION:
                textTractions.text = "Traction : " + String(e.count)
                break
            }
        }
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
