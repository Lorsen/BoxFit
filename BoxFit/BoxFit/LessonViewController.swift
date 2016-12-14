//
//  LessonViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/12/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class LessonViewController: UIViewController {

    var activityToReceive: String = "not chosen"
    
    var routineOne: String = "routineOne"
    var routineTwo: String = "routineTwo"
    var routineThree: String = "routineThree"
    var jab: String = "jab"
    var hook: String = "hook"
    var cross: String = "cross"
    var block: String = "block"
    
    var type: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                "This is the string corrleated with the information for jab training"
        }
        else if(type == cross) {
            return
                "This is the string correlated with the information for cross training"
        }
        else if(type == hook) {
            return
                "This is the string correlated with the information for hook training"
        }
        else if(type == block) {
            return
                "This is the string correlated with the information for the block training"
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
                "This is the name of the jab training's image"
        }
        else if(type == cross) {
            return
                "This is the name of the cross training's image"
        }
        else if(type == hook) {
            return
                "This is the name of the hook training's image"
        }
        else if(type == block) {
            return
                "This is the name of the block training's image"
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
