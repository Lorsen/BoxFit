//
//  TrainingViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/6/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//  
// Code borrowed from http://truelogic.org/wordpress/2015/10/04/how-to-make-an-image-grid-in-swift/
// Thank you Amit Sengupta

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
        routineImageData = ["routine_glove_1", "routine_glove_2", "routine_glove_3"]

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == self.trainingCollectionView {
            let trainingCell = collectionView.dequeueReusableCell(withReuseIdentifier: trainingCollectionViewIdentifier, for: indexPath as IndexPath) as! ImageCell
            
            let customColor = UIColor(red: 226/255.0, green: 71/255.0, blue: 40/255.0, alpha: 1.0)
            trainingCell.backgroundColor = customColor
            var currImage:String = ""
            currImage = self.trainingImageData[self.trainingImageCounter]
            
            if(self.trainingImageCounter == 0){
                trainingCell.movement = "jab"
            }
                
            else if(self.trainingImageCounter == 1){
                trainingCell.movement = "hook"
            }
                
            else if(self.trainingImageCounter == 2){
                trainingCell.movement = "uppercut"
            }
                
            else if(self.trainingImageCounter == 3 ){
                trainingCell.movement = "block"
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
            
            let customColor = UIColor(red: 226/255.0, green: 71/255.0, blue: 40/255.0, alpha: 1.0)
            routineCell.backgroundColor = customColor
            var currImage:String = ""
            currImage = self.routineImageData[self.routineImageCounter]
            
            if(self.routineImageCounter == 0){
                routineCell.movement = "routineOne"
            }
                
            else if(self.routineImageCounter == 1){
                routineCell.movement = "routineTwo"
            }
                
            else if(self.trainingImageCounter == 2){
                routineCell.movement = "routinethree"
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
    

        // Needed two segues for two differnt collection view cells
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ImageCell
        if(segue.identifier == "prepViewSegue" || segue.identifier == "prepViewSegueFromRoutine") {
            let nextViewController = (segue.destination as! PrepViewController)
            nextViewController.type = cell.movement
        }
    }

}
