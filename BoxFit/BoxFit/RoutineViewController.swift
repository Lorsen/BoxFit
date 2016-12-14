//
//  RoutineViewController.swift
//  BoxFit
//
//  Created by Omar Roa on 12/12/16.
//  Copyright © 2016 Omar Roa. All rights reserved.
//

import UIKit
import KDCircularProgress
import AVFoundation


class RoutineViewController: UIViewController {

    
    @IBOutlet weak var TimerLabel: UILabel!
    var progressBar: KDCircularProgress! = nil
    var type: String!
    
    var routineOne: String = "routineOne"
    var routineTwo: String = "routineTwo"
    var routineThree: String = "routineThree"
    var jab: String = "jab"
    var hook: String = "hook"
    var uppercut: String = "uppercut"
    var block: String = "block"
    
    var mh: MotionHandler!
    
    var routine: Array<String>!
    var routineIndex: Int = 0
    var routineTimer: Timer!
    var timer: Timer!
    var countdown: Double = 5.0
    var audioPlayer: AVAudioPlayer!
    var result: Array<String>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TimerLabel.text = String(format: "%.1f", 5.0)
        mh = MotionHandler(i: 0.02)
        mh.start()
        TimerLabel.text = String(format: "%.1f", countdown)
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countDown), userInfo: nil, repeats: true)
    }

    func startRoutine() {
        routine = setRoutine()
        result = Array()
        createCircularProgress()
        view.addSubview(progressBar)
        
        routineTimer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(doMove), userInfo: nil, repeats: true)
    }
    func doMove() {
        let move = routine[routineIndex]
        
        //say command
        let soundPath = Bundle.main.path(forResource: move, ofType: "mp3")
        let soundUrl = URL(fileURLWithPath: soundPath!)
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: soundUrl)
        }
        catch is NSError {
            print("error with audio file")
        }
        audioPlayer.prepareToPlay()
        audioPlayer.play()
        
        //listen for punch
        if let data = mh.getNextMotion(timeout: 1.0) {
            //do http request stuff
            result.append(makePrediction(data))
        } else {
            result.append("Miss")
        }
   
        routineIndex += 1
        let angle: Double = Double(routineIndex * 360) / Double(routine.count)
        progressBar.animate(toAngle: angle, duration: 0.25, completion: nil)
        if(routineIndex == routine.count) {
            routineTimer.invalidate()
            self.performSegue(withIdentifier: "ResultSegue", sender: nil)
        }

        
    }
    func makePrediction(_ data: [String: [String: String]]) -> String{
        //do AlamoFire stuff here
        return ""
    }
    func setRoutine() -> Array<String>{
        if(type == routineOne) {
            return [jab, hook, jab, jab, uppercut]
        }
        else if(type == routineTwo) {
            return [jab, jab, jab, uppercut, uppercut, hook, hook, jab]
        }
        else if(type == routineThree) {
            return [jab, jab, jab, uppercut, hook, hook, jab, jab, uppercut, jab, hook, jab, jab, uppercut]
        }
        else if(type == jab) {
            return [jab, jab, jab, jab, jab, jab, jab, jab, jab, jab]
        }
        else if(type == uppercut) {
            return [uppercut, uppercut, uppercut, uppercut, uppercut, uppercut, uppercut, uppercut, uppercut, uppercut]
        }
        else if(type == hook) {
            return [hook, hook, hook, hook, hook, hook, hook, hook, hook, hook]
        }
        else if(type == block) {
            return [block, block, block, block, block, block, block, block, block, block]
        }
        else {
            return []
        }
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
    func createCircularProgress() {
        progressBar = KDCircularProgress(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        progressBar.startAngle = -90
        progressBar.progressThickness = 0.5
        progressBar.trackThickness = 0.6
        progressBar.gradientRotateSpeed = 2
        progressBar.roundedCorners = true
        progressBar.glowMode = .constant
        progressBar.glowAmount = 1.0
        progressBar.set(colors: UIColor.red)
        progressBar.center = CGPoint(x: view.center.x, y:view.center.y+25)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultsController = (segue.destination as! ResultViewController)
            print(result)
            resultsController.punches = result
        }
    }
    
}
