//
//  CharacterDetailScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct CharacterDetailScreenView: View {
    // MARK: Variables

    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("Race: \(viewModel.character.cRace?.title ?? "")")
                    .font(.title)
                Text("Class: \(viewModel.character.cClass?.title ?? "")")
                    .font(.title)

                Group {
                    if let stats = viewModel.character.cStats {
                        Text("Strength: \(stats.strength.calculatedStat.formattedString)")
                        Text("Dexterity: \(stats.dexterity.calculatedStat.formattedString)")
                        Text("Constitution: \(stats.constitution.calculatedStat.formattedString)")
                        Text("Wisdom: \(stats.wisdom.calculatedStat.formattedString)")
                        Text("Intelligence: \(stats.intelligence.calculatedStat.formattedString)")
                        Text("Charisma: \(stats.charisma.calculatedStat.formattedString)")
                    }
                }
                Spacer()
            }
            .font(.title3)
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .navigationTitle(viewModel.character.name ?? "")
        .navigationBarItems(trailing: TrailingNavItem)
        .onScreenAppear(perform: viewModel.onAppear)
        .fullScreenCover(item: $viewModel.itemUpsertCharacterScreenModel) { item in
            UpsertCharacterScreenView(viewModel: .init(model: item, onCharacterChange: viewModel.onCharacterChange))
        }
        .alert("Are you sure to delete the character ?", isPresented: $viewModel.isShowingDeleteConfirmation) {
            Button("Delete", role: .destructive, action: { viewModel.deleteCharacter(dismiss: dismiss.callAsFunction) })
            Button("Cancel", role: .cancel, action: {})
        }
    }

    // MARK: Subcomponents

    @ViewBuilder
    var TrailingNavItem: some View {
        if viewModel.isLoadingDelete {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        } else {
            Menu {
                Button("Edit", systemImage: "highlighter", action: viewModel.onEditPress)
                Button("Delete", systemImage: "trash", role: .destructive, action: viewModel.onDeletePress)
            } label: {
                Image(systemName: "ellipsis.circle")
                    .frame(width: Size.Input, height: Size.Input)
            }
        }
    }
}

#Preview("Example 1") {
    NavigationStack {
        CharacterDetailScreenView(viewModel: .example1)
    }
}
