//
//  CharacterListViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

extension CharacterListView {
    class StateViewModel: ObservableObject {
        // MARK: Variables

        @Published var searchText: String = ""

        // MARK: Methods

        func filterData(data: [Character]) -> [Character] {
            let filteredCharacters = searchText.isEmpty
                ? data
                : data.filter { $0.name?.lowercased().contains(searchText.lowercased()) ?? false }
            return filteredCharacters
        }
    }

    class ViewModel {
        // MARK: Variables

        let result: Loadable<[Character]>
        let onRefresh: () async -> Void

        // MARK: Life Cycle

        init(
            result: Loadable<[Character]>,
            onRefresh: @escaping () async -> Void
        ) {
            self.result = result
            self.onRefresh = onRefresh
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(result: .content(data: [.example1, .example2, .example3, .example4, .example5], isLoading: false), onRefresh: {})
            return viewModel
        }

        static var example2: ViewModel {
            let viewModel = ViewModel(result: .content(data: [.example1, .example2, .example3, .example4, .example5], isLoading: true), onRefresh: {})
            return viewModel
        }

        static var example3: ViewModel {
            let viewModel = ViewModel(result: .empty, onRefresh: {})
            return viewModel
        }

        static var example4: ViewModel {
            let viewModel = ViewModel(result: .failed(error: MassiveRPGAppError.SampleError), onRefresh: {})
            return viewModel
        }
#endif
    }
}
