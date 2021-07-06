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
    func saveJoke(_ joke: OwnJoke) {
        ownJokes.append(joke)
        tableView.reloadData()
    }
    

    @IBOutlet weak var editButton: UIBarButtonItem!
    let cellID = "Cell"
    let ownJokeKey = "joke Key"
    private var ownJokes: [OwnJoke] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        if let newJoke = UserDefaults.standard.string(forKey: ownJokeKey) {
            ownJokes.append(newJoke)
        }
        tableView.reloadData()

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let addNewJokeVC = segue.destination as? AddNewJokeViewController else { return }
        addNewJokeVC.delegate = self
    }
    

    @IBAction func editButtonPressed(_ sender: UIBarButtonItem) {
        
        if tableView.isEditing {
            tableView.isEditing = false
            editButton.title = "Edit"
        } else {
            tableView.isEditing = true
            editButton.title = "Done"
        }
    }
    


    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
            ownJokes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    

}
