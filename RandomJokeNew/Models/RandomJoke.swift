//
//  RandomJoke.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 02.07.2021.
//

import Foundation


// MARK: - Joke
struct RandomJoke: Codable {
    let error: Bool?
    let category: String
    let type: String
    let setup: String
    let delivery: String

    let flags: Flags?
    let safe: Bool?
    let id: Int?
    let lang: String?
}

// MARK: - Flags
struct Flags: Codable {
    let nsfw, religious, political, racist: Bool?
    let sexist, explicit: Bool?
}
