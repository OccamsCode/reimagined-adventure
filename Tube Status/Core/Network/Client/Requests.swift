//
//  Requests.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import Poppify

// MARK: - /Line/Mode/{modes}/Status
struct LineModeStatusRequest: Requestable {
    let path: String
    let parameters: [URLQueryItem]
    
    enum Mode: String {
        case tube
        case dir
    }
    
    init(_ mode: LineModeStatusRequest.Mode = .tube) {
        self.path = "/Line/Mode/\(mode.rawValue)/Status"
        self.parameters = []
    }
}
