//
//  CharacterModelDTO.swift
//  RickYMortySergio
//
//  Created by Sergio Cobos on 25/4/24.
//

import Foundation

struct CharacterResponseDTO: Codable {
    let info: Info
    let results: [RyMCharacterDTO]
}

struct Info: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}

struct RyMCharacterDTO: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: Status
    let species: Species
    let gender: Gender
    let image: URL
    let episode: [String]
    let created: String
}

enum Gender: String, Codable, CaseIterable, Identifiable {
    var id: Self {self}
    case female = "Female"
    case male = "Male"
    case unknown = "unknown"
    case genderless = "Genderless"
    case all = "all"
}

enum Species: String, Codable {
    case alien = "Alien"
    case human = "Human"
    case humanoid = "Humanoid"
    case mythologicalCreature = "Mythological Creature"
    case animal = "Animal"
    case robot = "Robot"
    case poopybutthole = "Poopybutthole"
    case cronenberg = "Cronenberg"
    case disease = "Disease"
    case unknown = "unknown"
}

enum Status: String, Codable {
    case alive = "Alive"
    case dead = "Dead"
    case unknown = "unknown"
}
