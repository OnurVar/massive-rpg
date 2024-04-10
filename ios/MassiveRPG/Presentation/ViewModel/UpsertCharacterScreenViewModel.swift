//
//  UpsertCharacterScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Factory
import SwiftUI

extension UpsertCharacterScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.createCharacterUseCase) private var createCharacterUseCase
        @Injected(\.updateCharacterUseCase) private var updateCharacterUseCase

        let character: Character?
        let title: String
        @Published var name: String
        @Published var cRace: CharacterRace
        @Published var cClass: CharacterClass
        @Published var statStrength: Int
        @Published var statDexterity: Int
        @Published var statConstitution: Int
        @Published var statWisdom: Int
        @Published var statIntelligence: Int
        @Published var statCharisma: Int

        var calculatedStrength: Int { StatCalculator(value: statStrength).calculatedValue }
        var calculatedDexterity: Int { StatCalculator(value: statDexterity).calculatedValue }
        var calculatedConstitution: Int { StatCalculator(value: statConstitution).calculatedValue }
        var calculatedWisdom: Int { StatCalculator(value: statWisdom).calculatedValue }
        var calculatedIntelligence: Int { StatCalculator(value: statIntelligence).calculatedValue }
        var calculatedCharisma: Int { StatCalculator(value: statCharisma).calculatedValue }

        // MARK: Life Cycle

        init(model: UpsertCharacterScreenView.Model) {
            let character = model.character

            self.character = character

            switch model.type {
            case .Create:
                self.title = "Create Character"
            case .Update(let character):
                self.title = "Update \(character.name ?? "")"
            }

            self.name = character?.name ?? ""
            self.cRace = character?.cRace ?? .default
            self.cClass = character?.cClass ?? .default

            if
                let strength = character?.stats?.strength,
                let dexterity = character?.stats?.dexterity,
                let constitution = character?.stats?.constitution,
                let wisdom = character?.stats?.wisdom,
                let intelligence = character?.stats?.intelligence,
                let charisma = character?.stats?.charisma,
                CharacterStatsChecker(
                    strength: strength,
                    dexterity: dexterity,
                    constitution: constitution,
                    wisdom: wisdom,
                    intelligence: intelligence,
                    charisma: charisma
                ).isValid
            {
                self.statStrength = strength
                self.statDexterity = dexterity
                self.statConstitution = constitution
                self.statWisdom = wisdom
                self.statIntelligence = intelligence
                self.statCharisma = charisma

            } else {
                self.statStrength = 10
                self.statDexterity = 10
                self.statConstitution = 10
                self.statWisdom = 10
                self.statIntelligence = 10
                self.statCharisma = 10
            }
        }

        // MARK: Action Methods

        func onSavePress() {
            let newCharacterStats = CharacterStats(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: statCharisma
            )

            if let characterId = character?.id {
                let newCharacter = Character(
                    id: characterId,
                    name: name,
                    cRace: cRace,
                    cClass: cClass,
                    stats: newCharacterStats,
                    createdAt: Date().toString()
                )
                update(newCharacter: newCharacter, characterId: characterId)
            } else {
                let newCharacter = Character(
                    id: nil,
                    name: name,
                    cRace: cRace,
                    cClass: cClass,
                    stats: newCharacterStats,
                    createdAt: Date().toString()
                )
                create(newCharacter: newCharacter)
            }
        }

        func onStrengthChange(oldValue: Int, newValue: Int) {
            print("onStrengthChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: newValue,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: statCharisma
            )

            if checker.isNotValid {
                statStrength = oldValue
            }
        }

        func onDexterityChange(oldValue: Int, newValue: Int) {
            print("onDexterityChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: statStrength,
                dexterity: newValue,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: statCharisma
            )

            if checker.isNotValid {
                statDexterity = oldValue
            }
        }

        func onConstitutionChange(oldValue: Int, newValue: Int) {
            print("onConstitutionChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: newValue,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: statCharisma
            )

            if checker.isNotValid {
                statConstitution = oldValue
            }
        }

        func onWisdomChange(oldValue: Int, newValue: Int) {
            print("onWisdomChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: newValue,
                intelligence: statIntelligence,
                charisma: statCharisma
            )

            if checker.isNotValid {
                statWisdom = oldValue
            }
        }

        func onIntelligenceChange(oldValue: Int, newValue: Int) {
            print("onIntelligenceChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: newValue,
                charisma: statCharisma
            )

            if checker.isNotValid {
                statIntelligence = oldValue
            }
        }

        func onCharismaChange(oldValue: Int, newValue: Int) {
            print("onCharismaChange oldValue:\(oldValue) newValue: \(newValue)")
            let checker = CharacterStatsChecker(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: newValue
            )

            if checker.isNotValid {
                statCharisma = oldValue
            }
        }

        // MARK: Methods

        func create(newCharacter: Character) {
            Task {
                let result = await createCharacterUseCase.execute(character: newCharacter)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        MassiveToast.makeToast(message: "Character is created successfully.")
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }

        func update(newCharacter: Character, characterId: String) {
            Task {
                let result = await updateCharacterUseCase.execute(character: newCharacter, forId: characterId)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        MassiveToast.makeToast(message: "Character is updated successfully.")
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(model: .init(type: .Create))
            return viewModel
        }

        static var example2: ViewModel {
            let viewModel = ViewModel(model: .init(type: .Update(character: .example1)))
            return viewModel
        }
#endif
    }
}

extension UpsertCharacterScreenView {
    struct Model: Identifiable {
        // MARK: Variables

        let id: String
        let type: UpsertCharacterScreenType

        var character: Character? {
            switch type {
            case .Create:
                return nil
            case .Update(let character):
                return character
            }
        }

        // MARK: Life Cycle

        init(type: UpsertCharacterScreenType) {
            self.id = UUID().uuidString
            self.type = type
        }
    }
}

enum UpsertCharacterScreenType {
    case Create
    case Update(character: Character)
}
