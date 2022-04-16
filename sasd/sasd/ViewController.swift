//
//  ViewController.swift
//  sasd
//
//  Created by Гость on 16.04.2022.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var pcCar: UIImageView!
    @IBOutlet weak var userCar: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var sematorLabel: UILabel!
    @IBOutlet weak var lineFinish: UIImageView!
    
    
    
    var stateSemafor: Int = 1
    var timerGame: Timer!
    var timerPC: Timer!
    
    @objc func pcDriver() {
        
        if stateSemafor == 2 {
            pcCar.center.x += 10
        }
        
        
        if pcCar.center.x > lineFinish.center.x {
            resultLabel.isHighlighted = false
            resultLabel.text = "YOU LOSE!"
            resultLabel.textColor = .red
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    @objc func intervalTimer() {
        stateSemafor += 1
         
        if stateSemafor > 2{
            stateSemafor = 1
        }
        switch stateSemafor{
        case 1:
            sematorLabel.text = "STOP"
            sematorLabel.textColor = .red
        case 2:
            sematorLabel.text = "DRIVE"
            sematorLabel.textColor = .green
        default:
            break
        }
    }
    
    @IBAction func startGame(_ sender: UIButton) {
        sematorLabel.isHidden = false
        
        
        timerGame =
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(intervalTimer), userInfo: nil, repeats: true)
        timerPC = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(pcDriver), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func driverGame(_ sender: UIButton) {
        if stateSemafor == 2 {
            userCar.center.x += 10
        }
        else if stateSemafor == 1 {
            userCar.center.x -= 10
        }
        
        if userCar.center.x > lineFinish.center.x {
            resultLabel.isHidden = false
            resultLabel.text = "YOU WiN!"
            resultLabel.textColor = .green
            timerPC.invalidate()
            timerGame.invalidate()
        }
    }
    
    
    }




