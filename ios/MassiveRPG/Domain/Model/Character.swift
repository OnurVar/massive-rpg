//
//  Character.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import FirebaseFirestore

struct Character: Codable, Identifiable {
    @DocumentID var id: String?
    var name: String?
    var cRace: CharacterRace?
    var cClass: CharacterClass?
    var createdAt: String?
    var updatedAt: String?
    var deletedAt: String?

    enum CodingKeys: String, CodingKey {
        case id,
             name,
             cRace = "race",
             cClass = "class",
             createdAt = "created_at",
             updatedAt = "updated_at",
             deletedAt = "deleted_at"
    }

    init(
        id: String?,
        name: String?,
        cRace: CharacterRace? = nil,
        cClass: CharacterClass? = nil,
        createdAt: String? = nil,
        updatedAt: String? = nil,
        deletedAt: String? = nil
    ) {
        self.id = id
        self.name = name
        self.cRace = cRace
        self.cClass = cClass
        self.createdAt = createdAt
        self.updatedAt = updatedAt
        self.deletedAt = deletedAt
    }
}

#if DEBUG
    extension Character {
        static var example1: Character {
            Character(
                id: "CHARACTER_1",
                name: "CHARACTER_1"
            )
        }

        static var example2: Character {
            Character(
                id: "CHARACTER_2",
                name: "CHARACTER_2"
            )
        }

        static var example3: Character {
            Character(
                id: "CHARACTER_3",
                name: "CHARACTER_3"
            )
        }

        static var example4: Character {
            Character(
                id: "CHARACTER_4",
                name: "CHARACTER_4"
            )
        }

        static var example5: Character {
            Character(
                id: "CHARACTER_5",
                name: "CHARACTER_5"
            )
        }
    }
#endif
