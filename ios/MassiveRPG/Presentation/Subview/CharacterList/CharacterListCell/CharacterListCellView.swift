//
//  CharacterListCellView.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct CharacterListCellView: View {
    // MARK: Variables

    let viewModel: ViewModel

    // MARK: Body Component

    var body: some View {
        VStack {
            Text("Name: \(viewModel.character.name ?? "")")
        }
        .frame(height: 50)
        .background(Color.black.opacity(0.1))
    }
}

#Preview("Example 1") {
    CharacterListCellView(viewModel: .example1)
}
