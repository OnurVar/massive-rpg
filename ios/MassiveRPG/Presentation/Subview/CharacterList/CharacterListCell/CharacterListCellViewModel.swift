//
//  CharacterListCellViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import Factory
import SwiftUI

extension CharacterListCellView {
    class StateViewModel: ObservableObject {
        // MARK: Variables

        @Injected(\.deleteCharacterUseCase) private var deleteCharacterUseCase

        @Published var itemUpsertCharacterScreenModel: UpsertCharacterScreenView.Model? = nil
        @Published var isShowingDeleteConfirmation = false

        let character: Character
        let onCharacterDelete: () -> Void

        // MARK: Life Cycle

        init(character: Character, onCharacterDelete: @escaping () -> Void) {
            self.character = character
            self.onCharacterDelete = onCharacterDelete
        }

        // MARK: Action Methods

        func onEditPress(character: Character) {
            itemUpsertCharacterScreenModel = .init(type: .Update(character: character))
        }

        func onDeletePress() {
            isShowingDeleteConfirmation.toggle()
        }

        // MARK: Methods

        func deleteCharacter() {
            guard let characterId = character.id else { return }

            Task {
                let result = await deleteCharacterUseCase.execute(forId: characterId)
                await MainActor.run { [weak self] in
                    guard let self else { return }
                    switch result {
                    case .success:
                        self.onCharacterDelete()
                        MassiveToast.makeToast(message: "Character is deleted successfully.")
                    case .failure(let error):
                        MassiveToast.makeToast(message: error.localizedDescription)
                    }
                }
            }
        }
    }

    class ViewModel {
        // MARK: Variables

        let character: Character
        let title: String
        let subtitle: String

        // MARK: Life Cycle

        init(character: Character) {
            self.character = character
            self.title = character.name ?? ""
            self.subtitle = "\(character.cRace?.title ?? "") / \(character.cClass?.title ?? "")"
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(character: .example1)
            return viewModel
        }
#endif
    }
}
