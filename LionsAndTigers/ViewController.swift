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
    var lions:[Lion] = []
    var lionCubs:[LionCub] = []
    
    
    var currentIndex = 0

    var currentAnimal = (species: "Tiger", index: 0)
    
    
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
        
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = false
        lion.image = UIImage(named: "Lion.jpg")
        lion.name = "Mufasa"
        lion.subspecies = "West African"
        
        // Another instance of the class 'Lion()'
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        //self to access lions array is a property, so we can access it with 'self' keyword array += [instance instance]
        lion.roar()
        lioness.roar()
        
        
        lion.changeToAlphaMale()
        println(lion.isAlphaMale)
            self.lions += [lion,lioness]
        
        var lionCub = LionCub ()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.lionCubs += [lionCub, femaleLionCub]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {

        updateAnimal()
        updateView()
    }
    
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(lionCubs.count)))
            currentAnimal = ("LionCub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
            
        }
    }
    
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 2, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            if self.currentAnimal.species == "Tiger" {
                let tiger = self.myTigers[self.currentAnimal.index]
            self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.ageLabel.text = "\(tiger.age)"
                self.nameLabel.text = tiger.name
                self.randomFactLabel.text = tiger.randomFact()
                
            }
            else if self.currentAnimal.species == "Lion" {
                let lion = self.lions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.breedLabel.text = lion.subspecies
                self.ageLabel.text = "\(lion.age)"
                self.nameLabel.text = lion.name
                self.randomFactLabel.text = lion.randomFact()
            }
            
            else if self.currentAnimal.species  == "LionCub" {
                let lionCub = self.lionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.breedLabel.text = lionCub.subspecies
                self.ageLabel.text = "\(lionCub.age)"
                self.nameLabel.text = lionCub.name
            self.randomFactLabel.text = lionCub.randomFact()
            }
            
            self.randomFactLabel.hidden = false
            
            }, completion: {
                (finished: Bool) -> () in
        })
        }
    }
    
    


/* 
Our array prints out 4 different tiger instances and shows 4 elements in it. However the local variable is not accessible! "myTiger" is a local variable and not a property. Properties are accessible.

First time is to encapsulate information - automatic access to name breed age and image. Scope: accessible for all the following functions */
