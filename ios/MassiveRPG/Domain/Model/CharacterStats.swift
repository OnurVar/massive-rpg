//
//  CharacterStats.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

struct CharacterStats: Codable {
    var strength: Int?
    var dexterity: Int?
    var constitution: Int?
    var wisdom: Int?
    var intelligence: Int?
    var charisma: Int?
}

#if DEBUG
extension CharacterStats {
    static var example1: CharacterStats {
        CharacterStats(strength: 12, dexterity: 12, constitution: 12, wisdom: 12, intelligence: 12, charisma: 10)
    }

    static var example2: CharacterStats {
        CharacterStats(strength: 8, dexterity: 8, constitution: 8, wisdom: 8, intelligence: 12, charisma: 16)
    }

    static var example3: CharacterStats {
        CharacterStats(strength: 10, dexterity: 10, constitution: 14, wisdom: 6, intelligence: 14, charisma: 6)
    }
}

#endif
