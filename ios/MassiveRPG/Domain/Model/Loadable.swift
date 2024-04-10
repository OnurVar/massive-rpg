//
//  LoadableResult.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

enum Loadable<T> {
    case empty
    case content(data: T?, isLoading: Bool)
    case failed(error: Error)

    var isLoading: Bool {
        switch self {
        case let .content(_, isLoading): return isLoading
        default: return false
        }
    }

    var data: T? {
        switch self {
        case let .content(data, _): return data
        default: return nil
        }
    }

    var error: Error? {
        switch self {
        case let .failed(error): return error
        default: return nil
        }
    }
}
