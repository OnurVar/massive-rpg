//
//  AuthRepository.swift
//  MassiveRPG-Prod
//
//  Created by Onur Var on 8.04.2024.
//

import Combine
import UIKit

protocol AuthRepository {
    func registerSignedInUserPublisher() -> AnyPublisher<User?, Never>
    func signIn(viewController: UIViewController) async -> Result<User, Error>
    func signOut() -> Result<Void, Error>
}
