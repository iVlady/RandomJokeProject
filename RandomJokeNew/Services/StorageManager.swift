//
//  StorageManager.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 08.07.2021.
//

import Foundation

class StorageManager {
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults.standard
    private let jokeKey = "joke Key"
    
    private init() {}
    
    func save(_ joke: OwnJoke) {
        var jokes = fetchJokes()
        jokes.append(joke)
        guard let data = try? JSONEncoder().encode(jokes) else { return }
        userDefaults.set(data, forKey: jokeKey)
    }
    
    func fetchJokes() -> [OwnJoke] {
        guard let data = userDefaults.value(forKey: jokeKey) as? Data else {
            return []
        }
        guard let jokes = try? JSONDecoder().decode([OwnJoke].self, from: data) else {
            return []
        }
        return jokes
    }
    
    func deleteJoke(at index: Int) {
        var jokes = fetchJokes()
        jokes.remove(at: index)
        guard let data = try? JSONEncoder().encode(jokes) else { return }
        userDefaults.set(data, forKey: jokeKey)
    }
}
