//
//  Character.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import FirebaseFirestore

struct Character: Codable, Identifiable {
    @DocumentID var id: String?
    @ExplicitNull var name: String?
    @ExplicitNull var cRace: CharacterRace?
    @ExplicitNull var cClass: CharacterClass?
    @ExplicitNull var cStats: CharacterStats?
    var isDeleted: Bool
    @ServerTimestamp var createdAt: Timestamp?
    @ServerTimestamp var updatedAt: Timestamp?

    enum CodingKeys: String, CodingKey {
        case id,
             name,
             cRace = "race",
             cClass = "class",
             cStats = "stats",
             createdAt = "created_at",
             updatedAt = "updated_at",
             isDeleted = "is_deleted"
    }

    init(
        id: String?,
        name: String,
        cRace: CharacterRace,
        cClass: CharacterClass,
        cStats: CharacterStats,
        isDeleted: Bool,
        createdAt: Date?,
        updatedAt: Date?
    ) {
        self.id = id
        self.name = name
        self.cRace = cRace
        self.cClass = cClass
        self.cStats = cStats
        self.isDeleted = isDeleted

        if let createdAt {
            self.createdAt = .init(date: createdAt)
        } else {
            self.createdAt = nil
        }

        if let updatedAt {
            self.updatedAt = .init(date: updatedAt)
        } else {
            self.updatedAt = nil
        }
    }

    mutating func update(withForm form: CharacterForm) {
        self.name = form.name
        self.cRace = form.cRace
        self.cClass = form.cClass
        self.cStats = form.cStats
        self.isDeleted = form.isDeleted
    }
}

#if DEBUG
    extension Character {
        static var example1: Character {
            Character(
                id: "CHARACTER_1",
                name: "CHARACTER_1",
                cRace: .Dwarf,
                cClass: .Bard,
                cStats: .example1,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )
        }

        static var example2: Character {
            Character(
                id: "CHARACTER_2",
                name: "CHARACTER_2",
                cRace: .Elf,
                cClass: .Cleric,
                cStats: .example2,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )
        }

        static var example3: Character {
            Character(
                id: "CHARACTER_3",
                name: "CHARACTER_3",
                cRace: .Orc,
                cClass: .Fighter,
                cStats: .example3,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )
        }

        static var example4: Character {
            Character(
                id: "CHARACTER_4",
                name: "CHARACTER_4",
                cRace: .Human,
                cClass: .Rogue,
                cStats: .example1,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )
        }

        static var example5: Character {
            Character(
                id: "CHARACTER_5",
                name: "CHARACTER_5",
                cRace: .default,
                cClass: .Wizard,
                cStats: .example2,
                isDeleted: false,
                createdAt: nil,
                updatedAt: nil
            )
        }
    }
#endif
