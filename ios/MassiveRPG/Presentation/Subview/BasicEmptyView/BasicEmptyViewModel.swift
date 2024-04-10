//
//  BasicEmptyViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

extension BasicEmptyView {
    class ViewModel {
        // MARK: Life Cycle
        
        init() {}
        
#if DEBUG
        
        // MARK: Examples
        
        static var example1: ViewModel {
            let viewModel = ViewModel()
            return viewModel
        }
#endif
    }
}

