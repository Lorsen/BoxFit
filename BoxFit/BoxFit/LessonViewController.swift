//
//  LessonViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/12/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//
// Descriptions used from http://www.expertboxing.com/boxing-basics/how-to-box/the-beginners-guide-to-boxing and http://www.wikihow.com/Throw-a-Left-Hook-in-Boxing

import UIKit

class LessonViewController: UIViewController {
    
    var routineOne: String = "routineOne"
    var routineTwo: String = "routineTwo"
    var routineThree: String = "routineThree"
    var jab: String = "jab"
    var hook: String = "hook"
    var uppercut: String = "uppercut"
    var block: String = "block"
    
    var type: String!
    
    @IBOutlet weak var displayText: UITextView!
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func backButtonPress(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        displayText.text = pickText(type: type)
        var imageName = pickImage(type: type)
        displayImage.image = UIImage(named: imageName)!
        displayLabel.text = type;
        
        let customColor = UIColor(red: 226/255.0, green: 71/255.0, blue: 40/255.0, alpha: 1.0)
        self.view.backgroundColor = customColor

        
        // Do any additional setup after loading the view.
    }
    func pickText(type: String) -> String {
        if(type == routineOne) {
            return
                "This is the string correlated with the information for routine One!!!"
        }
        else if(type == routineTwo) {
            return
                "This is the string correlated with the information for routine two!!!"
        }
        else if(type == routineThree) {
            return
                "This is the string correlated with the information for routine three!!!"
        }
        else if(type == jab) {
            return
            "Jab\nKeeping the rest of your body still, extend your left fist straight forward.\nExhale sharply as you punch, rotating the fist to land with the palm down.\nPull the hand back immediately after impact to defend.\nThe jab is the most important punch in boxing.\nIt can attack, defend, counter, score points, make space, and many other things.\nIt’s your longest, fastest punch, uses the least energy, and leaves you the least vulnerable.\nA boxing trainer will usually tell you that every combo must start with the jab.\nIt’s a fast punch that stuns your opponent just long enough for the big punches to land."
        }
        else if(type == uppercut) {
            return
            "Uppercut\nRotate your hips and upper body CCW as you pivot your right foot (about 90 degrees).\nYour body rotates just like a right cross (don’t lean forward or backward).\nWith your elbow pointing down, drop your right fist slightly and swing it upwards as you exhale.\nThe punch lands with the palm facing up.\nKeep this punch compact, and recover to your stance quickly.\nThe right uppercut is a devastating punch to use at close range or mid-range. \nIt’s very powerful to throw at the head or body.\nThe greatest risk is that you’re dropping your right hand and exposing yourself to a counter left hook."
        }
        else if(type == hook) {
            return
            "Hook\nDo the following simultaneously:\nPlant your back (right) foot and keep it there.\nThis foot will move when you move forward to deliver the blow.\nShift your left foot onto the toe and twist rightward as if you are stamping out a cigarette.\nLower your left arm and cock it at a 50 degree angle\nTwist your torso to the left.\nKeep your right hand at the chin as a guard.\nThen do the following simultaneously:\nStarting with the legs, unwind your slightly twisted body while twisting your left foot on its toe to the right.\nUse all of the force you can muster to unwind your torso.\nKeep your chin down (always) and your head facing forward.\nIdeally, your head will stay in the same place throughout the duration of the punch.\nKeep your left arm locked at a 90-degree angle."
        }
        else if(type == block) {
            return
            "Block\nBring your gloves closer to cover your face.\nRaise right glove to block left-handed punches.\nRaise left glove to block right-handed punches."
        }
        else {
            return "no information found for this option"
        }
    }
    
    func pickImage(type: String) -> String {
        if(type == routineOne) {
            return
                "This is the name of routine One's image"
        }
        else if(type == routineTwo) {
            return
                "This is the name of routine two's image"
        }
        else if(type == routineThree) {
            return
                "This is the name of routine three's image"
        }
        else if(type == jab) {
            return
                "jab_demo"
        }
        else if(type == uppercut) {
            return
                "uppercut_demo"
        }
        else if(type == hook) {
            return
                "hook_demo"
        }
        else if(type == block) {
            return
                "block_demo"
        }
        else {
            return "no information found for this option"
        }
    }



    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
