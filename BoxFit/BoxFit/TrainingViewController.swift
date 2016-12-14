//
//  TrainingViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/6/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class TrainingViewController: UIViewController {

    @IBOutlet weak var TrainingScroll: UIScrollView!
    @IBOutlet weak var RoutineScroll: UIScrollView!
    
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
