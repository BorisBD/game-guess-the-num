//
//  PcGuessViewController.swift
//  guessNumGame
//
//  Created by Boris Dudnik on 16.11.2021.
//

import UIKit

class PcGuessViewController: UIViewController {
    
    var round = 0
    var score = 0
    var yourNum = 0
    var pcGuessNum = 0
    var minValue = 1
    var maxValue = 100
    var message = ""
        
   
    
    @IBOutlet weak var numShowLabel: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var stepButtonShow: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        stepButtonShow.isHidden = true
        numShowLabel.isHidden = true
        slider.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func sliderChangedValue(_ sender: UISlider) {
        numShowLabel.text = String(Int(slider.value))
        yourNum = Int(slider.value)
        stepButtonShow.isHidden = false
        
    }

    @IBAction func exitButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func startNewGame(_ sender: UIButton) {
        score = 0
        round = 0
        minValue = 1
        maxValue = 100
        slider.isHidden = false
        numShowLabel.isHidden = false
        numShowLabel.text = "0"
        slider.isHidden = false
        pcGuessNum = (1...100).randomElement()!
        
    }
    
    @IBAction func makeNumButtonPressed(_ sender: UIButton) {
        slider.isHidden = true
        stepButtonShow.isHidden = true
        yourNum = Int(slider.value)
         while (pcGuessNum != yourNum) {
                if pcGuessNum > yourNum {
                    score += 100
                    round += 1
                    maxValue = pcGuessNum
                    pcGuessNum = (minValue...maxValue).randomElement()!
                     
                } else  if pcGuessNum < yourNum {
                    score += 100
                    round += 1
                    minValue = pcGuessNum
                    pcGuessNum = (minValue...maxValue).randomElement()!
                    }
                }
        numShowLabel.isHidden = true
        if round < 10 {
           message = "Вы заработали \(score) золота, компьютер \(1000 - (round * 100)), он угадал ваше число за \(round) раз."
        } else {
            message = "Вы заработали \(score) золота, компьютер проиграл, он превысил число попыток на  \(round - 10)"
        }
        let alert = UIAlertController(
        title: "Игра окончена", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ясно", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
          
        }
        
    }
    
  

