//
//  RootScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import SwiftUI

struct RootScreenView: View {
    // MARK: Variables

    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        if viewModel.isSignedIn {
            HomeScreenView(viewModel: .init())
        } else {
            SignInScreenView(viewModel: .init())
        }
    }
}

#Preview("Example 1") {
    RootScreenView(viewModel: .example1)
}
