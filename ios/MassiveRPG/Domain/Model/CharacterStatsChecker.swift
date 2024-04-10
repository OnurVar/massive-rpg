//
//  CharacterStatsChecker.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

struct CharacterStatsChecker {
    let TOTAL_POINT_TO_GIVE = 80 // 10 for each stats + 20
    let strength: Int
    let dexterity: Int
    let constitution: Int
    let wisdom: Int
    let intelligence: Int
    let charisma: Int

    var isValid: Bool {
        let total = (strength + dexterity + constitution + wisdom + intelligence + charisma)
        let valid = total <= TOTAL_POINT_TO_GIVE
        print("total: \(total) isValid: \(valid)")
        return valid
    }

    var isNotValid: Bool {
        return !isValid
    }
}
