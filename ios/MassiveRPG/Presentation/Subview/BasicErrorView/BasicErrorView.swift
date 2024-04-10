//
//  BasicErrorView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct BasicErrorView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack {
            Text(viewModel.message)
                .multilineTextAlignment(.center)
        }
        .frame(height: Size.BigInput)
    }
}

#Preview("Example 1") {
    BasicErrorView(viewModel: .example1)
}
