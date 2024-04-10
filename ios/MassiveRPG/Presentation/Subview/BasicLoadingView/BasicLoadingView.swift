//
//  BasicLoadingView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct BasicLoadingView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack {
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
        }
        .frame(height: Size.BigInput)
    }
}

#Preview("Example 1") {
    BasicLoadingView(viewModel: .example1)
}
