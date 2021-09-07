//
//  DisplayJokeViewController.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 04.07.2021.
//

import UIKit

class DisplayJokeViewController: UIViewController {

    @IBOutlet weak var jokeQuestionLabel: UILabel!
    @IBOutlet weak var jokeAnswerLabel: UILabel!
    
    var jokeQue: String?
    var jokeAns: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        jokeQuestionLabel.layer.cornerRadius = 15
        jokeQuestionLabel.clipsToBounds = true
        jokeAnswerLabel.layer.cornerRadius = 15
        jokeAnswerLabel.clipsToBounds = true
        
        jokeQuestionLabel.text = jokeQue
        jokeAnswerLabel.text = jokeAns
        
    }

}
