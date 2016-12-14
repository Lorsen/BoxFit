//
//  LearningViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/5/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class LearningViewController: UIViewController,  UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {

    var imageData: [String] = [String]()
    var imageCounter: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        imageData = ["jab", "hook", "uppercut", "block"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! ImageCell
        
        cell.backgroundColor = UIColor.red
        var currImage:String = ""
        currImage = self.imageData[self.imageCounter]
        
        if(self.imageCounter == 0){
            cell.movement = "jab"
        }
        
        else if(self.imageCounter == 1){
            cell.movement = "hook"
        }
        
        else if(self.imageCounter == 2){
            cell.movement = "uppercut"
        }
        
        else if(self.imageCounter == 3 ){
           cell.movement = "block"
        }
    
        self.imageCounter += 1
        
        
        if self.imageCounter >= self.imageData.count {
            self.imageCounter = 0
        }
        
        cell.image.image = UIImage(named: currImage)
        return cell
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        
        return CGSize(width: 90, height: 90)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! ImageCell
        print(cell.movement)
        
        if(segue.identifier == "LessonSegue") {
            let nextViewController = (segue.destination as! LessonViewController)
            nextViewController.type = cell.movement
        }

    }
}

