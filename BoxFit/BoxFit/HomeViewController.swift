//
//  HomeViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/5/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var defaults: UserDefaults!

    @IBOutlet weak var lifetimeLabel: UILabel!
    @IBOutlet weak var accurateLabel: UILabel!
    @IBOutlet weak var fastestLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults.init()
        
        fastestLabel.text = String(defaults.double(forKey: "fastestPunch"))
        accurateLabel.text = String(defaults.double(forKey: "mostAccurate"))
        lifetimeLabel.text = String(defaults.integer(forKey: "lifetimePunches"))

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

