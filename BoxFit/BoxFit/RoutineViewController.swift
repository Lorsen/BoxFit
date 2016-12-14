//
//  RoutineViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/12/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class RoutineViewController: UIViewController {

    @IBOutlet weak var TimerLabel: UILabel!
    var type: String!
    
    var timer: Timer!
    var countdown: Double = 5.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TimerLabel.text = String(format: "%.1f", countdown)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)

    }

    func startRoutine() {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func countDown() {
        countdown -= 0.1
        TimerLabel.text = String(format: "%.1f", countdown)
        if(countdown <= 0) {
            timer.invalidate()
            TimerLabel.isHidden = true;
            startRoutine()
        }
        
    }
    
}
