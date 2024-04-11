//
//  CharacterStats.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

struct CharacterStats: Codable {
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let wisdom: Int
    let intelligence: Int
    let charisma: Int

    init(
        strength: Int,
        dexterity: Int,
        constitution: Int,
        wisdom: Int,
        intelligence: Int,
        charisma: Int
    ) {
        self.strength = strength
        self.dexterity = dexterity
        self.constitution = constitution
        self.wisdom = wisdom
        self.intelligence = intelligence
        self.charisma = charisma
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.strength = try container.decode(Int.self, forKey: .strength)
        self.dexterity = try container.decode(Int.self, forKey: .dexterity)
        self.constitution = try container.decode(Int.self, forKey: .constitution)
        self.wisdom = try container.decode(Int.self, forKey: .wisdom)
        self.intelligence = try container.decode(Int.self, forKey: .intelligence)
        self.charisma = try container.decode(Int.self, forKey: .charisma)
    }
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
