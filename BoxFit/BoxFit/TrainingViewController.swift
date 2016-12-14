//
//  TrainingViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/6/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    @IBOutlet weak var TrainingScroll: UIScrollView!
    @IBOutlet weak var RoutineScroll: UIScrollView!
    
    let trainingCollectionViewIdentifier = "TrainingCell"
    let routineCollectionViewIdentifier = "RoutineCell"
    
    @IBOutlet weak var trainingCollectionView: UICollectionView!
    @IBOutlet weak var routineCollectionView: UICollectionView!
    
    var trainingImageData: [String] = [String]()
    var trainingImageCounter: Int = 0
    
    var routineImageData: [String] = [String]()
    var routineImageCounter: Int = 0
    
    var defaults: UserDefaults!
    override func viewDidLoad() {
        defaults = UserDefaults.init()
        super.viewDidLoad()
        if(!defaults.bool(forKey: "returningUser")) { //do first time setup
            defaults.set("on", forKey: "sound")
            defaults.set(0, forKey: "height")
            defaults.set(0, forKey: "weight")
            defaults.set("male", forKey: "gender")
            defaults.set(0.0, forKey: "fastestPunch")
            defaults.set(0.0, forKey: "mostAccurate")
            defaults.set(0, forKey: "lifetimePunches")
            defaults.set(true, forKey: "returningUser")
        }
        
        trainingImageData = ["jab", "hook", "uppercut", "block"]
        routineImageData = ["routine1", "routine2", "routine3"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.trainingCollectionView {
            let trainingCell = collectionView.dequeueReusableCell(withReuseIdentifier: trainingCollectionViewIdentifier, for: indexPath as IndexPath) as! ImageCell
            
            trainingCell.backgroundColor = UIColor.red
            var currImage:String = ""
            currImage = self.trainingImageData[self.trainingImageCounter]
            
            if(self.trainingImageCounter == 0){
                trainingCell.movement = "Jab"
            }
                
            else if(self.trainingImageCounter == 1){
                trainingCell.movement = "Hook"
            }
                
            else if(self.trainingImageCounter == 2){
                trainingCell.movement = "UpperCut"
            }
                
            else if(self.trainingImageCounter == 3 ){
                trainingCell.movement = "Block"
            }
            
            self.trainingImageCounter += 1
            
            if self.trainingImageCounter >= self.trainingImageData.count {
                self.trainingImageCounter = 0
            }
            
            trainingCell.trainingImage.image = UIImage(named: currImage)
            return trainingCell
        }
            
        else{
            let routineCell = collectionView.dequeueReusableCell(withReuseIdentifier: routineCollectionViewIdentifier, for: indexPath as IndexPath) as! ImageCell
            
            routineCell.backgroundColor = UIColor.red
            var currImage:String = ""
            currImage = self.routineImageData[self.routineImageCounter]
            
            if(self.routineImageCounter == 0){
                routineCell.movement = "routine1"
            }
                
            else if(self.routineImageCounter == 1){
                routineCell.movement = "routine2"
            }
                
            else if(self.trainingImageCounter == 2){
                routineCell.movement = "routine3"
            }
            
            self.routineImageCounter += 1
            
            if self.routineImageCounter >= self.routineImageData.count {
                self.routineImageCounter = 0
            }
            
            routineCell.routineImage.image = UIImage(named: currImage)
            return routineCell
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.trainingCollectionView {
            return 4
        }
        
        return 3
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
    }
    
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let cell = sender as! ImageCell
    
            if(segue.identifier == "prepViewSegue") {
                let nextViewController = (segue.destination as! PrepViewController)
                nextViewController.type = cell.movement
            }
            
        }

}
