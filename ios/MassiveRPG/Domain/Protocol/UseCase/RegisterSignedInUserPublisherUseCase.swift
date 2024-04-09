//
//  RegisterLoggedInUserPublisherUseCase.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 9.04.2024.
//

import Combine

protocol RegisterSignedInUserPublisherUseCase {
    func execute() -> AnyPublisher<User?, Never>
}
