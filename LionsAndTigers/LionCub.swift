//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Thinh Le on 11/12/14.
//  Copyright (c) 2014 Busyworks. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly () {
        println("LionCub: Snuggle and behappy")
        
    }
    
    override func roar() {
        
        super.roar()
        
        
        println("LionCub: Growl Growl")
    }

    override func randomFact() -> String {
        var randomFact: String
        if isAlphaMale {
            randomFact = "Cubs are usually hidden in the dense bush for approx. six weeks."
        } else {
            randomFact = "Cubs begin eating meat at age 6"
        };
        return randomFact
    }
}