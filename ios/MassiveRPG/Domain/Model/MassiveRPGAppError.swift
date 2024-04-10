//
//  MassiveRPGAppError.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 10.04.2024.
//

enum MassiveRPGAppError: Error {
    case CurrentUserNotFound

#if DEBUG
    case SampleError
#endif
}
