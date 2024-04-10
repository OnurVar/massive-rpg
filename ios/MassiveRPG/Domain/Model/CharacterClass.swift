//
//  CharacterClass.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

enum CharacterClass: String, Codable {
    case Fighter = "fighter"
    case Cleric = "cleric"
    case Rogue = "rogue"
    case Wizard = "wizard"
    case Bard = "bard"

    var title: String {
        self.rawValue.uppercased()
    }

    static var `default`: CharacterClass = .Fighter
    static var list: [CharacterClass] {
        return [.Fighter, .Cleric, .Rogue, .Wizard, .Bard]
    }
}
