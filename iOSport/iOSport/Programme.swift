//
//  Programme.swift
//  iOSport
//
//  Created by etudiant on 24/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

class Programme: NSObject, NSCoding {
    
    private static let EXPERIENCE_KEY: String = "experience"
    private static let KEY: String = "programs"
    
    var exercices: [Exercice];
    var name: String;
    
    init(name: String) {
        exercices = [Exercice]();
        self.name = name;
    }
    
    init(name: String, exercices: [Exercice]) {
        self.name = name
        self.exercices = exercices
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let exercices = aDecoder.decodeObject(forKey: "exercices") as! [Exercice]
        let name = aDecoder.decodeObject(forKey: "name") as! String
        self.init(name: name, exercices: exercices)
    }
    
    func addExercice(_ newExercice: Exercice) {
        self.exercices.append(newExercice)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(exercices, forKey: "exercices")
    }
    
    /*private struct Experience {
     static let abdo = 1
     static let dips = 3
     static let pompe = 2
     static let squat = 2
     static let traction = 4
     }*/
    func calculateXp() -> Int {
        var total: Int = 0
        for exo in exercices {
            var xp: Int = 0
            switch exo.type {
            case .TRACTION:
                xp += 1
            case .DIP:
                xp += 1
            case .POMPE, .SQUAT:
                xp += 1
            case .ABDO:
                xp += 1
            }
            total += xp * exo.count
        }
        
        return total
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
        let userDefaults = UserDefaults.standard
        let decoded = userDefaults.data(forKey: Programme.EXPERIENCE_KEY)
        
        var p : Programme?
        if decoded == nil {
            p = Programme(name: EXPERIENCE_KEY)
            p!.addExercice(Exercice(type: ExerciceType.ABDO, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.DIP, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.POMPE, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.SQUAT, count: 0))
            p!.addExercice(Exercice(type: ExerciceType.TRACTION, count: 0))
        } else {
            p = (NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! Programme)
        }
        
        return p!
    }
    
    static func loadPrograms() -> [Programme] {
        // Read
        let userDefaults = UserDefaults.standard
        let decoded = userDefaults.data(forKey: Programme.KEY)
        
        var programs: [Programme]?
        if decoded == nil {
            programs = [Programme]()
            programs!.append(baseProgram1())
            programs!.append(baseProgram2())
            programs!.append(baseProgram3())
        } else {
            programs = (NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Programme])
        }
        
        return programs!
    }
    
    func saveExperience() {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: self)
        userDefaults.set(encodedData, forKey: Programme.EXPERIENCE_KEY)
        userDefaults.synchronize()
    }
    
    static func saveToPlist(programs : [Programme]) {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: programs)
        userDefaults.set(encodedData, forKey: Programme.KEY)
        userDefaults.synchronize()
    }
}
