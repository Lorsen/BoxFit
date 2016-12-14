//
//  ResultViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/13/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var leastAccuratePunch: UILabel!
    @IBOutlet weak var mostAccuratePunch: UILabel!
    @IBOutlet weak var fastestPunch: UILabel!
    @IBOutlet weak var totalMoves: UILabel!
    @IBOutlet weak var percentageLabel: UILabel!
    
    var punches: Array<String>!
    var routine: Array<String>!
    var percentCounter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMoves.text = String(punches.count)
        
        for i in 0...punches.count-1 {
            if punches[i] == routine[i] {
                percentCounter += 1
            }
        }
        var accuracy = Double(percentCounter) / Double(punches.count)
        accuracy = accuracy * 100
        percentageLabel.text = String(format: "%.0f%%", accuracy)
        fastestPunch.text = String(0)
        mostAccuratePunch.text = String(0)
        leastAccuratePunch.text = String(0)
    }

    @IBAction func homeButtonPressed(_ sender: AnyObject) {
        print(punches)
        self.performSegue(withIdentifier: "TrainingSegue", sender: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "punchTableSegue") {
            let nextController = segue.destination as! PunchTableViewController
            nextController.punches = punches
        }

    }

}
