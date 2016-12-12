//
//  PrepViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/12/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class PrepViewController: UIViewController {
    
    @IBOutlet weak var routineImage: UIImageView!
    @IBOutlet weak var routineText: UITextView!
    
    var routineOneText: String!
    var routineTwoText: String!
    var routineThreeText: String!
    var type: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        routineText.text = pickText(type: type)
        let imageName = pickImage(type: type)
//        routineImage.image = UIImage(named: imageName)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func pickText(type: String) -> String {
        if(type == "routineOne") {
            return
                "This is the string correlated with the information for routine One!!!"
        }
        else if(type == "routineTwo") {
            return
                "This is the string correlated with the information for routine two!!!"
        }
        else if(type == "routineThree") {
            return
                "This is the string correlated with the information for routine three!!!"
        }
        else {
            return "no information found for this option"
        }
    }
    
    func pickImage(type: String) -> String {
        if(type == "routineOne") {
            return
                "This is the name of routine One's image"
        }
        else if(type == "routineTwo") {
            return
                "This is the name of routine two's image"
        }
        else if(type == "routineThree") {
            return
                "This is the name of routine three's image"
        }
        else {
            return "no information found for this option"
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "startTrainingSegue") {
            let nextController = (segue.destination as! RoutineViewController)
            nextController.type = type
        }
    }

    
}
