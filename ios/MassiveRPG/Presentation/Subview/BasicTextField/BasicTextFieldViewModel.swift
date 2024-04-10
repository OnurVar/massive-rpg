//
//  BasicTextFieldViewModel.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

extension BasicTextFieldView {
    class ViewModel {
        // MARK: Variables

        @Binding var text: String
        let title: String?

        // MARK: Life Cycle

        init(text: Binding<String>, title: String?) {
            self._text = text
            self.title = title
        }

#if DEBUG

        // MARK: Examples

        static var example1: ViewModel {
            let viewModel = ViewModel(text: .constant("Test"), title: "TITLE")
            return viewModel
        }
#endif
    }
}
