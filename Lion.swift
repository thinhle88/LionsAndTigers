//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Thinh Le on 11/12/14.
//  Copyright (c) 2014 Busyworks. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    
    func roar() {
    println("Lion: Roar Roar")
    }
    
    func changeToAlphaMale() {
        self.isAlphaMale = true
    }
    
    func randomFact() -> String {
        var randomFact:String
    
    if self.isAlphaMale {
        randomFact = "Male with darker manes are more likely to attract females"
    } else {
        randomFact = "Female lionesses form the stable society unit and do not tolerate outside females"
    }
        return randomFact
    }
}