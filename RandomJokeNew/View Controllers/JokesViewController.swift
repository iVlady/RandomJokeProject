//
//  ViewController.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 02.07.2021.
//

import UIKit

class JokesViewController: UIViewController {
    
    @IBOutlet weak var girlIconImage: UILabel!
    @IBOutlet weak var boyIconImage: UILabel!
    
    @IBOutlet weak var jokeSenderLabel: UILabel!
    @IBOutlet weak var jokeAnswerLabel: UILabel!
    @IBOutlet weak var activityController: UIActivityIndicatorView!
    @IBOutlet weak var startButton: UIButton!
    
    var network = NetworkService.shared
    let urlString = "https://v2.jokeapi.dev/joke/Any"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        jokeSenderLabel.isHidden = true
        jokeAnswerLabel.isHidden = true
        girlIconImage.isHidden = true
        boyIconImage.isHidden = true
        
        jokeSenderLabel.layer.cornerRadius = 15
        jokeAnswerLabel.layer.cornerRadius = 15
// Скругление лейблов почему-то не работает, пробовал в разных методах вью это сделать, не заработало почему-то
        
        startButton.layer.cornerRadius = 15
        activityController.isHidden = true
    }


    @IBAction func button(_ sender: UIButton) {
        
        activityController.startAnimating()
        activityController.hidesWhenStopped = true
        
        network.fetchJoke(for: urlString) { randomJoke, error in
            if let error = error {
                print("PROBLEM! \(error)")
                self.errorAlert()
            }
            if let randomJoke = randomJoke {
                
                self.jokeSenderLabel.isHidden = false
                self.jokeAnswerLabel.isHidden = false
                self.girlIconImage.isHidden = false
                self.boyIconImage.isHidden = false
                
                self.jokeSenderLabel.text = randomJoke.setup
                self.jokeAnswerLabel.text = randomJoke.delivery
                self.activityController.stopAnimating()
            }

        }
    }
}

extension JokesViewController {
    
    func errorAlert() {
        
        let blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))
        blurVisualEffectView.frame = view.bounds
        
        let ac = UIAlertController(title: "Ooooooopppsssss",
                                   message: "It seems that something went wrong. Please reload",
                                   preferredStyle: .alert)
        let reloadButton = UIAlertAction(title: "RELOAD",
                                         style: .cancel)
        { _ in
            self.network.fetchJoke(for: self.urlString) { randomJoke, error in
            if let error = error {
                print("PROBLEM! \(error)")
                self.errorAlert()
            }
                
            if let randomJoke = randomJoke {
                
                self.jokeSenderLabel.isHidden = false
                self.jokeAnswerLabel.isHidden = false
                self.girlIconImage.isHidden = false
                self.boyIconImage.isHidden = false
                
                self.jokeSenderLabel.text = randomJoke.setup
                self.jokeAnswerLabel.text = randomJoke.delivery
                self.activityController.stopAnimating()
                }
                blurVisualEffectView.removeFromSuperview()
            } 
        }
        ac.addAction(reloadButton)
        self.view.addSubview(blurVisualEffectView)
        self.present(ac, animated: true, completion: nil)
    }
}

