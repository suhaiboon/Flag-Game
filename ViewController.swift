//
//  ViewController.swift
//  FlagGame
//
//  Created by Suhaib AlMutawakel on 2/28/19.
//  Copyright © 2019 Suhaib AlMutawakel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = [String]()
    var score = 0
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Way one to add to an array of strings
        countries.append("estonia")
        countries.append("france")
        countries.append("germany")
        countries.append("ireland")
        countries.append("italy")
        countries.append("monaco")
        
        //Way two of adding to the array of strings
        countries += ["estonia", "france", "germany",
        "ireland", "italy", "monaco", "nigeria",
        "poland", "russia", "spain", "uk", "us"]
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
       
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        title = countries [correctAnswer].uppercased()+" - Your score is \(score)"
    }
    var total = 0
    var counter = 0
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        while (counter <= 10){
            if sender.tag == correctAnswer {
                title = "Correct"
                score += 1
                total = total + 1
                counter += 1
            }else {
                title = "Wrong"
                score -= 1
                total = total + 1
                counter += 1
            }
            if (total < 9) {
                let ac = UIAlertController (title: title, message :
                    "Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue",
                                           style: .default, handler: askQuestion))
                
                present (ac, animated: true)
                
            }else
            {
                let ac = UIAlertController (title: title, message :
                    "LAST QUESTION .. Your score is \(score)", preferredStyle: .alert)
                ac.addAction(UIAlertAction(title: "Continue",
                                           style: .default, handler: askQuestion))
                
                present (ac, animated: true)
                
            }
            
        }
        
       
        
        
        
     /*   if (total == 9)
        {
            let totalAnswer = UIAlertController (title: title, message: "last Question", preferredStyle: .alert)
            
            present(totalAnswer, animated: true)
        }*/
        
    }
    

}

