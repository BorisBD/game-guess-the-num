//
//  YourGuessViewController.swift
//  guessNumGame
//
//  Created by Boris Dudnik on 16.11.2021.
//

import UIKit

class YourGuessViewController: UIViewController {

    var round = 0
    var score = 1000
    var randomNum = 0
        
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var numShowLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepButtonShow: UIButton!
    @IBAction func sliderChangedValue(_ sender: UISlider) {
        numShowLabel.text = String(Int(slider.value))
    }
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        stepButtonShow.isHidden = true
        infoLabel.isHidden = true
        numShowLabel.isHidden = true
        slider.isHidden = true
        // Do any additional setup after loading the view.
    }
    

    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        randomNum = (1...100).randomElement()!
        score = 1000
        round = 0
        infoLabel.isHidden = true
        stepButtonShow.isHidden = false
        numShowLabel.isHidden = false
        numShowLabel.text = "0"
        slider.isHidden = false
        
    }
    
    @IBAction func makeStepButtonPressed(_ sender: UIButton) {
        infoLabel.isHidden = false
        
        if randomNum > Int(slider.value) {
            score -= 100
            round += 1
            infoLabel.text = "The number is greater than yours."
           
            
        } else if randomNum < Int(slider.value) {
            score -= 100
            round += 1
            infoLabel.text = "The number is less than yours."
            
            
            
        } else {
            round += 1
            stepButtonShow.isHidden = true
            numShowLabel.isHidden = true
            infoLabel.isHidden = true
            slider.isHidden = true
            if round < 10 {
            
            let alert = UIAlertController(
            title: "Game over",
            message: "You earned \(score) gold coins from 1000, in \(round) round(s).",
            preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style:
           .default, handler: nil))
            present(alert, animated: true, completion: nil)
            } else {
                let alert = UIAlertController(
                title: "Game over",
                message: "You lost, you exceeded the number of attempts.",
                preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ясно", style:
               .default, handler: nil))
                present(alert, animated: true, completion: nil)            }
            
        }
        
    }
    
    

}
