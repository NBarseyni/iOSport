//
//  Exercice.swift
//  iOSport
//
//  Created by etudiant on 24/06/2019.
//  Copyright © 2019 etudiant. All rights reserved.
//

import UIKit

enum ExerciceType {
    case ABDO
    case DIP
    case POMPE
    case SQUAT
    case TRACTION
}

/*
protocol Exercice {
    func getName() -> String
}
 */
class Exercice {
    let type: ExerciceType
    var count: Int
    
    init(type: ExerciceType, count: Int) {
        self.type = type
        self.count = count
    }
}
