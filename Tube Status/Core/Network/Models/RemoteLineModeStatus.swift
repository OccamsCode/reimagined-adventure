//
//  RemoteLineModeStatus.swift
//  Tube Status
//
//  Created by Brian Munjoma on 07/11/2023.
//

import Foundation

// MARK: - ValidityPeriod
struct ValidityPeriod: Codable {
    let type: String
    let fromDate, toDate: String
    let isNow: Bool

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case fromDate, toDate, isNow
    }
}

// MARK: - Crowding
struct Crowding: Codable {
    let type: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
    }
}
