//
//  UpsertCharacterScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct UpsertCharacterScreenView: View {
    // MARK: Variables

    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $viewModel.name)
                    }
                    .listRowBackground(Color.cListBackground)
                    Section {
                        Picker("Race", selection: $viewModel.cRace) {
                            ForEach(CharacterRace.list, id: \.self) {
                                Text($0.title)
                            }
                        }
                        Picker("Class", selection: $viewModel.cClass) {
                            ForEach(CharacterClass.list, id: \.self) {
                                Text($0.title)
                            }
                        }
                    }
                    .pickerStyle(.menu)
                    .listRowBackground(Color.cListBackground)

                    Section {
                        Stepper("Strength: \(viewModel.calculatedStrength.formattedString)",
                                value: $viewModel.statStrength,
                                in: 0 ... 20,
                                step: 1)

                        Stepper("Dexterity: \(viewModel.calculatedDexterity.formattedString)",
                                value: $viewModel.statDexterity,
                                in: 0 ... 20,
                                step: 1)

                        Stepper("Constitution: \(viewModel.calculatedConstitution.formattedString)",
                                value: $viewModel.statConstitution,
                                in: 0 ... 20,
                                step: 1)

                        Stepper("Wisdom: \(viewModel.calculatedWisdom.formattedString)",
                                value: $viewModel.statWisdom,
                                in: 0 ... 20,
                                step: 1)

                        Stepper("Intelligence: \(viewModel.calculatedIntelligence.formattedString)",
                                value: $viewModel.statIntelligence,
                                in: 0 ... 20,
                                step: 1)

                        Stepper("Charisma: \(viewModel.calculatedCharisma.formattedString)", value: $viewModel.statCharisma, in: 0 ... 20, step: 1)
                    }
                    .listRowBackground(Color.cListBackground)
                }
                .listRowBackground(Color.cListBackground)
                .scrollContentBackground(.hidden)
            }
            .navigationTitle(viewModel.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Save", action: { viewModel.onSavePress(dismiss: dismiss.callAsFunction) }))
            .navigationBarItems(leading: Button("", systemImage: "xmark", action: dismiss.callAsFunction))
            .onChange(of: viewModel.statStrength, initial: false, viewModel.onStrengthChange)
            .onChange(of: viewModel.statDexterity, initial: false, viewModel.onDexterityChange)
            .onChange(of: viewModel.statConstitution, initial: false, viewModel.onConstitutionChange)
            .onChange(of: viewModel.statWisdom, initial: false, viewModel.onWisdomChange)
            .onChange(of: viewModel.statIntelligence, initial: false, viewModel.onIntelligenceChange)
            .onChange(of: viewModel.statCharisma, initial: false, viewModel.onCharismaChange)
        }
    }
}

#Preview("Example 1") {
    UpsertCharacterScreenView(viewModel: .example1)
}

#Preview("Example 2") {
    UpsertCharacterScreenView(viewModel: .example2)
}
