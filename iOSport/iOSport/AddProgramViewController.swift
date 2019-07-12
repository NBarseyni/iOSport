//
//  AddProgramViewController.swift
//  iOSport
//
//  Created by nico on 06/07/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class AddProgramViewController: UIViewController {

    @IBOutlet weak var programName: UITextField!
    @IBOutlet weak var abdosCount: UITextField!
    @IBOutlet weak var dipsCount: UITextField!
    @IBOutlet weak var pompesCount: UITextField!
    @IBOutlet weak var squatsCount: UITextField!
    @IBOutlet weak var tractionsCount: UITextField!
    
    let program: Programme = Programme(name: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            program.name = programName.text!
            
            if abdosCount.text! != "0" {
                program.addExercice(Exercice(type: ExerciceType.ABDO, count: Int(abdosCount.text!)!))
            }
            
            if dipsCount.text! != "0" {
                program.addExercice(Exercice(type: ExerciceType.DIP, count: Int(dipsCount.text!)!))
            }
            
            if pompesCount.text! != "0" {
                program.addExercice(Exercice(type: ExerciceType.POMPE, count: Int(pompesCount.text!)!))
            }
            
            if squatsCount.text! != "0" {
                program.addExercice(Exercice(type: ExerciceType.SQUAT, count: Int(squatsCount.text!)!))
            }
            
            if tractionsCount.text! != "0" {
                program.addExercice(Exercice(type: ExerciceType.TRACTION, count: Int(tractionsCount.text!)!))
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
