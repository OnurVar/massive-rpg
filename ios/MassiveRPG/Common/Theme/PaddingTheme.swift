//
//  PaddingTheme.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

import SwiftUI

extension View {
    func customPadding(top: PaddingType = .None, leading: PaddingType = .None, bottom: PaddingType = .None, trailing: PaddingType = .None) -> some View {
        self.padding(EdgeInsets(top: top.size, leading: leading.size, bottom: bottom.size, trailing: trailing.size))
    }

    func customPaddingAll(type: PaddingType = .Medium) -> some View {
        self.customPadding(top: type, leading: type, bottom: type, trailing: type)
    }
}

enum PaddingType {
    /// 0px
    case None
    /// 2px
    case ExtraExtraExtraSmall
    /// 4px
    case ExtraExtraSmall
    /// 6px
    case ExtraSmall
    /// 8px
    case Small
    /// 12px
    case SemiMedium
    /// 16px
    case Medium
    /// 20px
    case SemiBig
    /// 24px
    case Big
    /// 32px
    case ExtraBig
    /// 64px
    case ExtraExtraBig
    /// Custom Size
    case Custom(size: CGFloat)

    var size: CGFloat {
        switch self {
        case .None:
            return 0.0
        case .ExtraExtraExtraSmall:
            return Size.ExtraExtraExtraSmall
        case .ExtraExtraSmall:
            return Size.ExtraExtraSmall
        case .ExtraSmall:
            return Size.ExtraSmall
        case .Small:
            return Size.Small
        case .SemiMedium:
            return Size.SemiMedium
        case .Medium:
            return Size.Medium
        case .SemiBig:
            return Size.SemiBig
        case .Big:
            return Size.Big
        case .ExtraBig:
            return Size.ExtraBig
        case .ExtraExtraBig:
            return Size.ExtraExtraBig
        case .Custom(let size):
            return size
        }
    }
}
