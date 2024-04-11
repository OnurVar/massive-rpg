//
//  HomeScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import SwiftUI

struct HomeScreenView: View {
    // MARK: Variables

    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        NavigationStack {
            VStack {
                CharacterListView(viewModel: .init(result: viewModel.resultCharacterList, onRefresh: viewModel.loadCharacterList))
            }
            .navigationTitle("My Characters")
            .navigationBarItems(leading: Button("Sign Out", action: viewModel.onSignOutPress))
            .navigationBarItems(trailing: Button("", systemImage: "plus", action: viewModel.onPlusPress))
            .onScreenAppear(perform: viewModel.onAppear)
            .fullScreenCover(item: $viewModel.itemUpsertCharacterScreenModel) { item in
                UpsertCharacterScreenView(viewModel: .init(model: item, onCharacterChange: viewModel.onCharacterChange))
            }
        }
    }

    // MARK: Subcomponents

    var PlusButton: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: viewModel.onPlusPress, label: {
                    Label("", systemImage: "plus")
                        .frame(width: Size.Input, height: Size.Input)
                })
                .labelStyle(.iconOnly)
                .buttonStyle(.bordered)
                .customPadding(bottom: .Medium, trailing: .Medium)
            }
        }
    }
}

#Preview("Example 1") {
    HomeScreenView(viewModel: .example1)
}

#Preview("Example 2") {
    HomeScreenView(viewModel: .example2)
}

#Preview("Example 3") {
    HomeScreenView(viewModel: .example3)
}

#Preview("Example 4") {
    HomeScreenView(viewModel: .example4)
}
