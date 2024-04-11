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
    @StateObject var stateViewModel: StateViewModel = .init()

    // MARK: Body Component

    var body: some View {
        VStack(spacing: Size.None) {
            switch viewModel.result {
            case .empty:
                EmptyView
            case .failed(let error):
                ErrorView(error: error)
            case .content(let data, let isLoading):
                let filteredData = stateViewModel.filterData(data: data ?? [])
                if filteredData.isEmpty, isLoading {
                    BasicLoadingView(viewModel: .init())
                } else {
                    ListView(data: filteredData)
                }
            }
        }
        .scrollContentBackground(.hidden)
        .searchable(text: $stateViewModel.searchText, placement: .navigationBarDrawer(displayMode: .always))
        .refreshable { await viewModel.onRefresh() }
    }

    // MARK: Subcomponents

    var EmptyView: some View {
        ScrollView {
            BasicEmptyView(viewModel: .init())
                .customPadding(top: .ExtraExtraBig)
        }
    }

    func ErrorView(error: Error) -> some View {
        ScrollView {
            BasicErrorView(viewModel: .init(error: error))
                .customPadding(top: .ExtraExtraBig)
        }
    }

    func ListView(data: [Character]) -> some View {
        List {
            ForEach(data) { item in
                NavigationLink {
                    CharacterDetailScreenView(viewModel: .init(character: item))
                } label: {
                    CharacterListCellView(character: item, onCharacterDelete: viewModel.onCharacterDelete)
                }
                .listRowBackground(Color.cListBackground)
            }
        }
    }
}

#Preview("Example 1") {
    NavigationStack {
        CharacterListView(viewModel: .example1)
    }
}

#Preview("Example 2") {
    NavigationStack {
        CharacterListView(viewModel: .example2)
    }
}

#Preview("Example 3") {
    NavigationStack {
        CharacterListView(viewModel: .example3)
    }
}

#Preview("Example 4") {
    NavigationStack {
        CharacterListView(viewModel: .example4)
    }
}
