//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Thinh Le on 10/28/14.
//  Copyright (c) 2014 Busyworks. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    // in order to store all of our Tigers, we need a container. The array will store all of our Tiger instances
    // the empty array now exists to the array "myTigers" targeting the struct
    var myTigers:[Tiger] = []
    
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        // var instance = Struct()
        
        var myTiger = Tiger()
        // creating a variable named myTiger. Use this variable to reference our Tiger instance. Typed "Tiger"
        myTiger.name = "Tigger"
        myTiger.breed = "Bengal"
        myTiger.age = 1
        myTiger.image = UIImage(named: "BengalTiger.jpg")
        
        
        myTiger.age = myTiger.ageInTigerYEarsFromAge(myTiger.age)
        
        myTiger.chuff()
        myTiger.chuffANumberOfTimes(5, isLoud: true)
        
        // myTigers (Array) - myTiger ( Instance)
        myTigers.append(myTiger)
        // could make it a local variable by:
        // var Tigers:[Tiger] = [myTiger]
        
        
        println("My Tiger's name is: \(myTiger.name), its' age is \(myTiger.age), its' breed is \(myTiger.breed), and the image is \(myTiger.image)")
        
        self.myImageView.image = myTiger.image
        self.nameLabel.text = myTiger.name
        self.ageLabel.text = "\(myTiger.age)"
        self.breedLabel.text = myTiger.breed
        self.randomFactLabel.text = myTiger.randomFact()
        
        // second instance of tiger
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg"   )
        
        secondTiger.age = secondTiger.ageInTigerYEarsFromAge(secondTiger.age)
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 3
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 4
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger, thirdTiger, fourthTiger]
        
        myTiger.chuffANumberOfTimes(3)
        secondTiger.chuffANumberOfTimes(2)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {

        var randomIndex:Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        }  while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let tiger = self.myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            
        self.myImageView.image = tiger.image
        self.nameLabel.text = tiger.name
        self.ageLabel.text = "\(tiger.age)"
        self.breedLabel.text = tiger.breed
        self.randomFactLabel.text = tiger.randomFact()
            
        
            }, completion: {
                (finished: Bool) -> () in
        })
    }
    
    
    
    
    
    
}

/* 
Our array prints out 4 different tiger instances and shows 4 elements in it. However the local variable is not accessible! "myTiger" is a local variable and not a property. Properties are accessible.

First time is to encapsulate information - automatic access to name breed age and image. Scope: accessible for all the following functions */
