//
//  CharacterListCellViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

extension CharacterListCellView {
    class ViewModel {
        // MARK: Variables

        let character: Character

        // MARK: Life Cycle
        
        init(character: Character) {
            self.character = character
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
