//
//  Programme.swift
//  iOSport
//
//  Created by etudiant on 24/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class Programme {
    private static let EXPERIENCE_KEY: String = "experience"
    private static let KEY: String = "programs"
    
    var exercices: [Exercice];
    var name: String;
    
    init(name: String) {
        exercices = [Exercice]();
        self.name = name;
    }
    
    func addExercice(_ newExercice: Exercice) {
        self.exercices.append(newExercice)
    }
    
    static func getDictionary() -> NSMutableDictionary {
        let path = Bundle.main.path(forResource: "Program", ofType: "plist")!
        let dict = NSMutableDictionary(contentsOfFile: path)
        return dict!
    }
    
    private static func baseProgram1() -> Programme {
        let p : Programme = Programme(name: "Simple")
        p.addExercice(Exercice(type: ExerciceType.POMPE, count: 10))
        p.addExercice(Exercice(type: ExerciceType.ABDO, count: 30))
        return p
    }
    
    private static func baseProgram2() -> Programme {
        let p : Programme = Programme(name: "Medium")
        p.addExercice(Exercice(type: ExerciceType.POMPE, count: 20))
        p.addExercice(Exercice(type: ExerciceType.TRACTION, count: 10))
        p.addExercice(Exercice(type: ExerciceType.SQUAT, count: 25))
        return p
    }
    
    private static func baseProgram3() -> Programme {
        let p : Programme = Programme(name: "Hard")
        p.addExercice(Exercice(type: ExerciceType.POMPE, count: 40))
        p.addExercice(Exercice(type: ExerciceType.TRACTION, count: 20))
        p.addExercice(Exercice(type: ExerciceType.SQUAT, count: 30))
        p.addExercice(Exercice(type: ExerciceType.DIP, count: 15))
        return p
    }
    
    static func loadExperience() -> Programme {
        let dict = getDictionary()
        
        var p : Programme? = dict.object(forKey: EXPERIENCE_KEY) as? Programme
        if p == nil {
            p = Programme(name: EXPERIENCE_KEY)
            p!.addExercice(Exercice(type: ExerciceType.ABDO, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.DIP, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.POMPE, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.SQUAT, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.TRACTION, count: 0))
        }
        
        return p!
    }
    
    static func loadPrograms() -> NSMutableArray {
        // Read
        let dict: NSMutableDictionary = getDictionary()
        let programs = dict.mutableArrayValue(forKey: KEY)
        
        if programs.count == 0 {
            programs.add(baseProgram1())
            programs.add(baseProgram2())
            programs.add(baseProgram3())
        }
        
        return programs
    }
    
    func saveExperience() {
        let path = Bundle.main.path(forResource: "Program", ofType: "plist")!
        let dict = Programme.getDictionary()
        
        dict.setValue(self, forKey: Programme.EXPERIENCE_KEY)
        dict.write(toFile: path, atomically: false)
    }
    
    static func saveToPlist(programs : NSMutableArray) {
        let path = Bundle.main.path(forResource: "Program", ofType: "plist")!
        let dict = Programme.getDictionary()
        
        dict.setValue(programs, forKey: Programme.KEY)
        
        dict.write(toFile: path, atomically: false)
    }
}
