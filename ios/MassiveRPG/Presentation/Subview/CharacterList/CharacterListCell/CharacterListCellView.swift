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
        VStack(alignment: .leading) {
            Text(viewModel.title)
                .labelStyle(.titleAndIcon)
                .font(.title2)
            Text(viewModel.subtitle)
                .font(.callout)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

#Preview("Example 1") {
    CharacterListCellView(viewModel: .example1)
}
