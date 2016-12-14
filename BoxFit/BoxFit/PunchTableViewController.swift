//
//  PunchTableViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/14/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit

class PunchTableViewController: UITableViewController {

    @IBOutlet var PunchTable: UITableView!
    
    var punches:Array<String>!
    override func viewDidLoad() {
        super.viewDidLoad()
        PunchTable.contentInset.top = UIApplication.shared.statusBarFrame.height
        PunchTable.allowsSelection = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return punches.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "punchCell", for: indexPath)
        cell.textLabel?.text = punches[indexPath.item]

        return cell
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
