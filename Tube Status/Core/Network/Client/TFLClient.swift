//
//  TFLClient.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import Poppify
import Injection

final class TFLClient: Client {
    @Injected(\.environmentProvider) var environment: EnvironmentType
    @Injected(\.sessionProvider) var urlSession: URLSessionType
}
