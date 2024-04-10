//
//  BasicErrorViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

extension BasicErrorView {
    class ViewModel {
        // MARK: Variables

        let message: String

        // MARK: Life Cycle

        init(error: Error) {
            self.message = error.localizedDescription
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(error: MassiveRPGAppError.SampleError)
            return viewModel
        }
#endif
    }
}
