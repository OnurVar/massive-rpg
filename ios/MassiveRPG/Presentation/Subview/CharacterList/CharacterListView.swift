//
//  CharacterListView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct CharacterListView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        switch viewModel.result {
        case .empty:
            EmptyView
        case .content(let data, let isLoading):
            ContentView(data: data ?? [], isLoading: isLoading)
        case .failed(let error):
            ErrorView(error: error)
        }
    }

    // MARK: Subcomponents

    var EmptyView: some View {
        BasicEmptyView(viewModel: .init())
    }

    func ContentView(data: [Character], isLoading: Bool) -> some View {
        VStack {
            if isLoading {
                BasicLoadingView(viewModel: .init())
            }
            if !data.isEmpty {
                ScrollView {
                    LazyVStack(spacing: Size.None) {
                        ForEach(data) { item in
                            CharacterListCellView(viewModel: .init(character: item))
                        }
                    }
                }
            }
        }
    }

    func ErrorView(error: Error) -> some View {
        BasicErrorView(viewModel: .init(error: error))
    }
}

#Preview("Example 1") {
    CharacterListView(viewModel: .example1)
}

#Preview("Example 2") {
    CharacterListView(viewModel: .example2)
}

#Preview("Example 3") {
    CharacterListView(viewModel: .example3)
}

#Preview("Example 4") {
    CharacterListView(viewModel: .example4)
}
