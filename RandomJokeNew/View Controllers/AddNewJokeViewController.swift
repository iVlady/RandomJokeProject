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
    
    @IBAction func cancelButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        saveAndExit()
    }
    
}

extension AddNewJokeViewController {
    
    private func saveAndExit() {
        guard let title = titleTextField.text else { return }
        guard let jokeFirst = jokeFirstTextField.text else { return }
        guard let jokeSecond = jokeSecondTextField.text else { return }
        
        if !title.isEmpty && !jokeFirst.isEmpty && !jokeSecond.isEmpty {
            let joke = OwnJoke(ownJokeName: title,
                               ownJokeSetup: jokeFirst,
                               ownJokeDelivery: jokeSecond)

            StorageManager.shared.save(joke)
            delegate.saveJoke(joke)
            dismiss(animated: true)
        } else {
            textFieldAlert()
        }
    }
    
    func textFieldAlert() {
                
        let blurVisualEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .extraLight))

        
        blurVisualEffectView.frame = view.bounds
        
        let ac = UIAlertController(title: "You missed something",
                                   message: "Please fill all fields",
                                   preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK",
                                     style: .default)
        { _ in
            blurVisualEffectView.removeFromSuperview()
        }
        
        ac.addAction(okButton)
        self.view.addSubview(blurVisualEffectView)
        self.present(ac, animated: true, completion: nil)
    }
}

