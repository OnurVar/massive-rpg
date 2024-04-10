//
//  UpsertCharacterScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct UpsertCharacterScreenView: View {
    // MARK: Variables

    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Name", text: $viewModel.name)
                    }
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

                    Section {
                        Stepper("Strength: \(viewModel.strength)",
                                value: $viewModel.strength,
                                in: 0 ... 20,
                                step: 1)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Sign Out", action: {}))
            .navigationBarItems(leading: Text("MassiveRPG"))
            .toolbarBackground(Color.cBackground, for: .navigationBar)
        }
    }
}

#Preview("Example 1") {
    UpsertCharacterScreenView(viewModel: .example1)
}

#Preview("Example 2") {
    UpsertCharacterScreenView(viewModel: .example2)
}
