//
//  SettingsViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/6/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    
    @IBOutlet var SettingsTable: UITableView!

    @IBOutlet weak var GenderSwitch: UISegmentedControl!
    @IBOutlet weak var heightField: UITextField!
    @IBOutlet weak var weightField: UITextField!
    @IBOutlet weak var soundSwitch: UISwitch!
    
    var defaults: UserDefaults!
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults = UserDefaults.init()
        SettingsTable.contentInset.top = UIApplication.shared.statusBarFrame.height
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        uiSetup()

    }
    func dismissKeyboard() {
        heightField.endEditing(true)
        weightField.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func onSoundSwitch(_ sender: UISwitch) {
        if(sender.isOn) {
            defaults.set("on", forKey: "sound")
        }
        else {
            defaults.set("off", forKey: "sound")
        }
    }
    @IBAction func onHeightChange(_ sender: UITextField){
        defaults.set(Double(sender.text!), forKey: "height")
    }

    @IBAction func onWeightChanged(_ sender: UITextField) {
        defaults.set(Double(sender.text!), forKey: "weight")

    }
    
    @IBAction func onGenderSwitch(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0) {
            defaults.set("male", forKey: "gender")
        }
        else {
            defaults.set("female", forKey: "gender")
        }
    }

    func uiSetup() {
        heightField.text = String(defaults.double(forKey: "height"))
        weightField.text = String(defaults.double(forKey: "weight"))
        if(defaults.string(forKey: "sound") == "on") {
            soundSwitch.setOn(true, animated: false)
        }
        else {
            soundSwitch.setOn(false, animated: false)
        }
        if(defaults.string(forKey: "gender") == "male") {
            GenderSwitch.setEnabled(true, forSegmentAt: 0)
        }
        else {
            GenderSwitch.setEnabled(true, forSegmentAt: 1)
        }
        
        
    }
}
