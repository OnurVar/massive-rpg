//
//  InputBackgroundModifier.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

struct InputBackgroundModifier: ViewModifier {
    // MARK: Life Cycle

    init() {}

    // MARK: Body Component

    func body(content: Content) -> some View {
        content
            .frame(height: Size.Input)
            .customPadding(leading: .Medium, trailing: .Medium)
            .background(Color.cInputBackground)
            .cornerRadius(CornerRadius.Small)
            .overlay(
                RoundedRectangle(cornerRadius: CornerRadius.Small)
                    .stroke(Color.cBorder, lineWidth: 1)
            )
    }
}

#Preview {
    VStack {
        TextField("", text: .constant(""))
            .modifier(InputBackgroundModifier())
    }
    .frame(height: Size.BigInput)
//    .background(Color.gray)
}
