//
//  RemoteLineModeStatus.swift
//  Tube Status
//
//  Created by Brian Munjoma on 07/11/2023.
//

import Foundation

// MARK: - Crowding
struct Crowding: Codable {
    let type: String?

    enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
}
