//
//  CharacterListCellView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct CharacterListCellView: View {
    // MARK: Variables

    let viewModel: ViewModel
    @StateObject var stateViewModel: StateViewModel

    init(character: Character, onCharacterDelete: @escaping () -> Void) {
        self.viewModel = .init(character: character)
        self._stateViewModel = StateObject(wrappedValue: .init(character: character, onCharacterDelete: onCharacterDelete))
    }

    // MARK: Body Component

    var body: some View {
        NavigationLink {
            CharacterDetailScreenView(viewModel: .init(character: viewModel.character))
        } label: {
            VStack(alignment: .leading, spacing: Size.Small) {
                Text(viewModel.title)
                    .labelStyle(.titleAndIcon)
                    .font(.system(size: 18))
                Text(viewModel.subtitle)
                    .font(.system(size: 14))
            }
            .customPadding(top: .Small, leading: .Medium, bottom: .Small)
        }
        .customPadding(trailing: .Medium)
        .background(Color.cInputBackground)
        .cornerRadius(Size.Small)
        .listRowSeparator(.hidden)
        .swipeActions {
            Button("Edit", action: { stateViewModel.onEditPress(character: viewModel.character) }).tint(.gray)
            Button("Delete", action: { stateViewModel.onDeletePress() }).tint(.red)
        }
        .fullScreenCover(item: $stateViewModel.itemUpsertCharacterScreenModel) { item in
            UpsertCharacterScreenView(viewModel: .init(model: item, onCharacterChange: stateViewModel.onDeletePress))
        }
        .alert("Are you sure to delete the character ?", isPresented: $stateViewModel.isShowingDeleteConfirmation) {
            Button("Delete", role: .destructive, action: stateViewModel.deleteCharacter)
            Button("Cancel", role: .cancel, action: {})
        }
    }
}

#Preview("Example 1") {
    List {
        CharacterListCellView(character: .example1, onCharacterDelete: {})
    }
    .listRowSeparator(.hidden)
    .listStyle(.inset)
}
