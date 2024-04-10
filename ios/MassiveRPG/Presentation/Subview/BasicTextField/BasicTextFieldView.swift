//
//  BasicTextFieldView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct BasicTextFieldView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack(alignment: .leading, spacing: Size.Small) {
            if let title = viewModel.title {
                Text(title)
            }
            TextField("", text: viewModel.$text)
                .modifier(InputBackgroundModifier())
        }
    }
}

#Preview("Example 1") {
    BasicTextFieldView(viewModel: .example1)
}
