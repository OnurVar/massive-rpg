//
//  SignInScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import SwiftUI

struct SignInScreenView: View {
    // MARK: Variables

    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack {
            Spacer()
            GoogleSignInButton(action: viewModel.onSignInPress)
                .frame(width: 200, height: 50)
                .padding(.init(top: 0, leading: 0, bottom: 100, trailing: 0))
        }
    }
}

#Preview("Example 1") {
    SignInScreenView(viewModel: .example1)
}
