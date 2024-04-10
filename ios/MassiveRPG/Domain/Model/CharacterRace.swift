//
//  CharacterRace.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

enum CharacterRace: String, Codable {
    case Elf = "elf"
    case Human = "human"
    case Dwarf = "dwarf"
    case Orc = "orc"

    var title: String {
        self.rawValue.capitalized
    }

    static var `default`: CharacterRace = .Elf
    static var list: [CharacterRace] {
        return [.Elf, .Human, .Dwarf, .Orc]
    }
}
