//
//  OwnListTableViewController.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 04.07.2021.
//

import UIKit



protocol AddJokeDelegate {
    func saveJoke (_ joke: OwnJoke)
}

class OwnListTableViewController: UITableViewController, AddJokeDelegate {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    let cellID = "Cell"
    private let ownJokeKey = "joke Key"
    private var ownJokes: [OwnJoke] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        ownJokes = StorageManager.shared.fetchJokes()
        tableView.reloadData()
    }
    
    func saveJoke(_ joke: OwnJoke) {
        ownJokes.append(joke)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addNewJokeVC = segue.destination as? AddNewJokeViewController else { return }
        addNewJokeVC.delegate = self
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let displayJokeVC = storyboard?.instantiateViewController(identifier: "displayJoke") as? DisplayJokeViewController else { return }
        let joke = ownJokes[indexPath.row]
        displayJokeVC.jokeAnswerLabel?.text = joke.ownJokeSetup
        displayJokeVC.jokeQuestionLabel?.text = joke.ownJokeDelivery
        navigationController?.pushViewController(displayJokeVC, animated: false)
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ownJokes.count
    }

    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        ownJokes.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let joke = ownJokes[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = joke.ownJokeName
        cell.contentConfiguration = content

        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

            StorageManager.shared.deleteJoke(at: indexPath.row)
            ownJokes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)

        }
    }
}


