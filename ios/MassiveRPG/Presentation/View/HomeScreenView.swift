//
//  HomeScreenView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import SwiftUI

struct HomeScreenView: View {
    // MARK: Variables

    @StateObject var viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        NavigationStack {
            VStack {
                Text("Home Screen")
                    .font(.title)
                    .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("Sign Out", action: viewModel.onSignOutPress))
            .navigationBarItems(leading: Text("MassiveRPG"))
        }
    }
}

#Preview("Example 1") {
    HomeScreenView(viewModel: .example1)
}
