//
//  AddNewJokeViewController.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 04.07.2021.
//

import UIKit

class AddNewJokeViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var jokeFirstTextField: UITextField!
    @IBOutlet weak var jokeSecondTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    var delegate: AddJokeDelegate!
    let ownJokeKey = "joke Key"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func editButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
//        guard let title = titleTextField.text else { return }
//        guard let jokeFirst = jokeFirstTextField.text else { return }
//        guard let jokeSecond = jokeSecondTextField.text else { return }
//
//        let ownJoke = OwnJoke(ownJokeName: title, ownJokeSetup: jokeFirst, ownJokeDelivery: jokeSecond)
//
//        delegate.saveJoke(joke: ownJoke)
//
//        UserDefaults.standard.set(ownJoke, forKey: ownJokeKey)
//        dismiss(animated: true)
        
        saveAndExit()
        
    }
    
//    func buttonStyle () {
//        guard let title = titleTextField.text,
//              let jokeFirst = jokeFirstTextField.text,
//              let jokeSecond = jokeSecondTextField.text
//        else { return }
//        if title.isEmpty && jokeFirst.isEmpty && jokeSecond.isEmpty {
//            saveButton.isEnabled = false
//        }
//    }
    
}

extension AddNewJokeViewController {
    
    private func saveAndExit() {
        guard let title = titleTextField.text else { return }
        guard let jokeFirst = jokeFirstTextField.text else { return }
        guard let jokeSecond = jokeSecondTextField.text else { return }
        
        let joke = OwnJoke(ownJokeSetup: jokeFirst,
                           ownJokeDelivery: jokeSecond,
                           ownJokeName: title)
        
        delegate.saveJoke(joke)
        dismiss(animated: true)
        
    }
}
