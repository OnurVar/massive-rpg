//
//  CharacterListViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

extension CharacterListView {
    class ViewModel {
        // MARK: Variables
        
        let result: Loadable<[Character]>

        // MARK: Life Cycle
        
        init(result: Loadable<[Character]>) {
            self.result = result
        }
        
#if DEBUG
        
        // MARK: Examples
        
        static var example1: ViewModel {
            let viewModel = ViewModel(result: .content(data: [.example1, .example2, .example3, .example4, .example5], isLoading: false))
            return viewModel
        }
        
        static var example2: ViewModel {
            let viewModel = ViewModel(result: .content(data: [], isLoading: true))
            return viewModel
        }
        
        static var example3: ViewModel {
            let viewModel = ViewModel(result: .empty)
            return viewModel
        }

        static var example4: ViewModel {
            let viewModel = ViewModel(result: .failed(error: MassiveRPGAppError.SampleError))
            return viewModel
        }
#endif
    }
}
