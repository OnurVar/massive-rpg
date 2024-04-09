//
//  UserContextDataSource.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//
import Combine

protocol UserContextDataSource {
    // User publisher for observing user changes
    var userPublisher: AnyPublisher<User?, Never> { get }

    // Signed in user
    var user: User? { get set }
}
