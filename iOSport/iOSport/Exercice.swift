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
class Exercice: NSObject, NSCoding {
    let type: ExerciceType
    var count: Int
    
    init(type: ExerciceType, count: Int) {
        self.type = type
        self.count = count
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let type = aDecoder.decodeInteger(forKey: "type")
        let count = aDecoder.decodeInteger(forKey: "count")
        self.init(type: Exercice.enumForInt(type), count: count)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(Exercice.intForEnum(type), forKey: "type")
        aCoder.encode(count, forKey: "count")
    }
    
    static func intForEnum(_ type: ExerciceType) -> Int {
        switch type {
        case .ABDO:
            return 0
        case .DIP:
            return 1
        case .POMPE:
            return 2
        case .SQUAT:
            return 3
        case .TRACTION:
            return 4
        }
    }
    
    static func enumForInt(_ intType: Int) -> ExerciceType {
        switch intType {
        case 0:
            return .ABDO
        case 1:
            return .DIP
        case 2:
            return .POMPE
        case 3:
            return .SQUAT
        case 4:
            return .TRACTION
        default:
            print("Wrong type: " + String(intType))
            return .ABDO
        }
    }
}
