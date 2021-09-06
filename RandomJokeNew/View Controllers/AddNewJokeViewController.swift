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
    
    @IBAction func cancelButtonPressed(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        saveAndExit()
    }
    
}

extension AddNewJokeViewController {
    
    private func saveAndExit() {
        guard let title = titleTextField.text else {
            print("1")
            return }
        guard let jokeFirst = jokeFirstTextField.text else {
            print("2")
            return }
        guard let jokeSecond = jokeSecondTextField.text else {
            print("3")
            return }
        
        let joke = OwnJoke(ownJokeName: title,
                           ownJokeSetup: jokeFirst,
                           ownJokeDelivery: jokeSecond)
        
        StorageManager.shared.save(joke)
        delegate.saveJoke(joke)
        dismiss(animated: true)
    }
}
