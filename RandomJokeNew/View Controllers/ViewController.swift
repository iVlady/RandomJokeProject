//
//  ViewController.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 02.07.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var jokeSenderLabel: UILabel!
    @IBOutlet weak var jokeAnswerLabel: UILabel!
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    @IBOutlet weak var oooopppssLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    
    var network = NetworkService.shared
    let urlString = "https://v2.jokeapi.dev/joke/Any"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeSenderLabel.layer.cornerRadius = 15
        jokeAnswerLabel.layer.cornerRadius = 15
// Скругление лейблов почему-то не работает, пробовал в разных методах вью это сделать, не заработало почему-то
        
        startButton.layer.cornerRadius = 14
        activityController.isHidden = true
        oooopppssLabel.isHidden = true
    }


    @IBAction func button(_ sender: UIButton) {
        
        activityController.isHidden = false
        activityController.startAnimating()
        
        
        network.getJoke(for: urlString) { randomJoke, error in
            if let error = error {
                print("nullllllllllll \(error)")
                self.oooopppssLabel.isHidden = false
                
            }
            if let randomJoke = randomJoke {
                self.jokeSenderLabel.text = randomJoke.setup
                self.jokeAnswerLabel.text = randomJoke.delivery
                self.activityController.stopAnimating()
                self.activityController.isHidden = true
                self.oooopppssLabel.isHidden = true

            }
        }
    }
}

