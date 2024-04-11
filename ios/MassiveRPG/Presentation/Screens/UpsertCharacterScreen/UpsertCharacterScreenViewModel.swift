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

        let onCharacterChange: () -> Void
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

        var calculatedStrength: Int { statStrength.calculatedStat }
        var calculatedDexterity: Int { statDexterity.calculatedStat }
        var calculatedConstitution: Int { statConstitution.calculatedStat }
        var calculatedWisdom: Int { statWisdom.calculatedStat }
        var calculatedIntelligence: Int { statIntelligence.calculatedStat }
        var calculatedCharisma: Int { statCharisma.calculatedStat }

        // MARK: Life Cycle

        init(model: UpsertCharacterScreenView.Model, onCharacterChange: @escaping () -> Void) {
            self.onCharacterChange = onCharacterChange

            self.character = model.character

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
                let strength = character?.cStats?.strength,
                let dexterity = character?.cStats?.dexterity,
                let constitution = character?.cStats?.constitution,
                let wisdom = character?.cStats?.wisdom,
                let intelligence = character?.cStats?.intelligence,
                let charisma = character?.cStats?.charisma,
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

        // MARK: Methods

        func create(form: CharacterForm, dismiss: @escaping () -> Void) {
            Task {
                let result = await createCharacterUseCase.execute(form: form)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        dismiss()
                        MassiveToast.makeToast(message: "Character is created successfully.")
                        self.onCharacterChange()
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }

        func update(characterId: String, form: CharacterForm, dismiss: @escaping () -> Void) {
            Task {
                let result = await updateCharacterUseCase.execute(forId: characterId, form: form)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        dismiss()
                        MassiveToast.makeToast(message: "Character is updated successfully.")
                        self.onCharacterChange()
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }

        // MARK: Action Methods

        func onSavePress(dismiss: @escaping () -> Void) {
            let cStats = CharacterStats(
                strength: statStrength,
                dexterity: statDexterity,
                constitution: statConstitution,
                wisdom: statWisdom,
                intelligence: statIntelligence,
                charisma: statCharisma
            )
            let form = CharacterForm(
                name: name,
                cRace: cRace,
                cClass: cClass,
                cStats: cStats,
                isDeleted: false
            )
            if let character, let characterId = character.id {
                update(characterId: characterId, form: form, dismiss: dismiss)
            } else {
                create(form: form, dismiss: dismiss)
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

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(model: .init(type: .Create), onCharacterChange: {})
            return viewModel
        }

        static var example2: ViewModel {
            let viewModel = ViewModel(model: .init(type: .Update(character: .example1)), onCharacterChange: {})
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
