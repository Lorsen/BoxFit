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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalMoves.text = String(punches.count)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextController = segue.destination as! PunchTableViewController
        nextController.punches = punches
    }

}
