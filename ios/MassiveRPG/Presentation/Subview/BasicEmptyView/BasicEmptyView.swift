//
//  BasicEmptyView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct BasicEmptyView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack(spacing: Size.Small) {
            Image(systemName: "list.dash")
            Text("No data found!")
        }
        .frame(height: Size.BigInput)
    }
}

#Preview("Example 1") {
    BasicEmptyView(viewModel: .example1)
}
