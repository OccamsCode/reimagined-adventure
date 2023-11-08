//
//  InjectedValues+Extension.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import Poppify
import Injection

// MARK: - Providers
private struct SessionProviderKey: InjectionKey {
    static var currentValue: URLSessionType = URLSession.shared
}

private struct ClientProviderKey: InjectionKey {
    static var currentValue: Client = TFLClient()
}

private struct EnvironmentProviderKey: InjectionKey {
    static var currentValue: EnvironmentType = computedEnvironment

    static var computedEnvironment: EnvironmentType {
            // TODO: Move App_Key to Config file
            let item = URLQueryItem(name: "app_key", value: "6fedd8b313f74f3cb750b9ecc26af642")
            return EnvironmentInfo(scheme: .secure,
                               endpoint: "api.tfl.gov.uk",
                               additionalHeaders: [:],
                               secret: .queryItem(item))
        }
}

// MARK: - Injected Values
extension InjectedValues {
    var clientProvider: Client {
        get { Self[ClientProviderKey.self] }
        set { Self[ClientProviderKey.self] = newValue }
    }

    var sessionProvider: URLSessionType {
        get { Self[SessionProviderKey.self] }
        set { Self[SessionProviderKey.self] = newValue }
    }

    var environmentProvider: EnvironmentType {
        get { Self[EnvironmentProviderKey.self] }
        set { Self[EnvironmentProviderKey.self] = newValue }
    }
}
