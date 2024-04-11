//
//  CharacterListCellViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

extension CharacterListCellView {
    class ViewModel {
        // MARK: Variables

        let title: String
        let subtitle: String

        // MARK: Life Cycle

        init(character: Character) {
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
