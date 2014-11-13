//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Thinh Le on 10/28/14.
//  Copyright (c) 2014 Busyworks. All rights reserved.
//

import Foundation
import UIkit

struct Tiger {
    // declaring attributes to our structure 'Tiger'
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named:"")
    
    func chuff() {
        println("Tiger: Chuff Chuff")
    }
    
    func chuffANumberOfTimes (numberOftimes: Int) {
        for var chuff = 0; chuff < numberOftimes; ++chuff{
            self.chuff()
            
        }
    }
    
    func chuffANumberOfTimes(numberOfTimes: Int, isLoud: Bool){
        for var chuffTimes = 1;
            chuffTimes <= numberOfTimes; chuffTimes++ {
                if isLoud {
                    chuff()
                    
                }
                else {
                    println("Tiger: purr purr")
                }
        }
    }
    
    func ageInTigerYEarsFromAge(regularAge: Int) -> Int {
        let newAge = regularAge*3
        return newAge
    }
    
    func randomFact() -> String {
        let randomNumber = Int(arc4random_uniform(UInt32(3)))
        
        var randomFact:String
        
        if randomNumber == 0 {
            randomFact = "The Tiger is the biggest species in the cat family"
        }
        else if randomNumber == 1 {
            randomFact = "Tigers can reach a length of 3.3 meters"
        }
        else {
            randomFact = "A group of tigers are known as an 'ambush' or 'streaks'"
        }
        return randomFact
        }

    }
