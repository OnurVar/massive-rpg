//
//  UpsertCharacterScreenViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

extension UpsertCharacterScreenView {
    class ViewModel: ObservableObject {
        // MARK: Variables

        let character: Character?
        let title: String
        @Published var name: String
        @Published var cRace: CharacterRace
        @Published var cClass: CharacterClass
        @Published var strength: Int = 10

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
