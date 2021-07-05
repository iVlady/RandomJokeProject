//
//  OwnJoke.swift
//  RandomJokeNew
//
//  Created by Vlad Vinogrotskiy on 04.07.2021.
//
import Foundation


//struct OwnJoke: Codable {
//    var ownJokeName: String
//    var ownJokeSetup: String
//    var ownJokeDelivery: String
//}

struct OwnJoke: Codable {
    let ownJokeSetup: String
    let ownJokeDelivery: String
    var ownJokeName: String
}
