//
//  ViewController.swift
//  BullsEye
//
//  Created by Константин Клинов on 8/13/18.
//  Copyright © 2018 Константин Клинов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var randomValue: UILabel!
    @IBOutlet weak var scoreLblb: UILabel!
    @IBOutlet weak var roundNumberLbl: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var score = 0
    var roundNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
        targetValue = Int.random(in: 1...100)
        newGame()
        
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")

        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        let trackLeftImage = #imageLiteral(resourceName: "SliderTrackLeft")
        let trackLeftResizeable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftImage, for: .normal)
        
        let trackRightImage = #imageLiteral(resourceName: "SmallButton")
        let trackRightResizeable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightImage, for: .normal)
        
    }


    @IBAction func showAlert(){
        let  diff = abs(targetValue - currentValue)
        var points = 100 - diff
        score += points
        let title: String
        
        if diff == 0 {
            title = "Perfect"
            points += 100
        } else if diff < 5 {
            title = "You almost had it!"
            points += 50
        } else if diff < 10 {
            title = "Pretty good!"
        } else {
            title = "not even close..."
       
        }
      
        let message = "You scored: \(points)"
       let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.startNewRound()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    

    @IBAction func startOverBtnWasPressed(){
        newGame()
    }
    
    
    @IBAction func sliderMoved(_ slider : UISlider){
        let roundedValue = slider.value.rounded()
        currentValue = Int(roundedValue)
    }
    
    func startNewRound(){
        targetValue = Int.random(in: 1...100)
        currentValue = 50
         roundNumber += 1
        slider.value = Float(currentValue)
        updateLabeles()
    }
    
    func updateLabeles() {
        randomValue.text = "\(targetValue)"
        scoreLblb.text = "\(score)"
        roundNumberLbl.text = "\(roundNumber)"

    }
   
    func newGame(){
        score = 0
        roundNumber = 1
        scoreLblb.text = "\(score)"
        roundNumberLbl.text = "\(roundNumber)"
    }
    
}

