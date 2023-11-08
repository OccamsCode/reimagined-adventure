//
//  RemoteLineModeStatus.swift
//  Tube Status
//
//  Created by Brian Munjoma on 07/11/2023.
//

import Foundation

typealias RemoteLineModeStatus = [LineModeStatusElement]

// MARK: - RemoteLineModeStatusElement
struct LineModeStatusElement: Codable {
    let type, id, name, modeName: String
    let disruptions: [Disruption]?
    let created, modified: String
    let lineStatuses: [LineStatus]?
    let serviceTypes: [ServiceType]?
    let crowding: Crowding?

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case id, name, modeName, disruptions, created, modified, lineStatuses, serviceTypes, crowding
    }
}

// MARK: - LineStatus
struct LineStatus: Codable {
    let type: String
    let id, statusSeverity: Int
    let statusSeverityDescription: String
    let created: String
    let validityPeriods: [ValidityPeriod]?
    let lineID, reason: String?
    let disruption: Disruption?

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case id, statusSeverity, statusSeverityDescription, created, validityPeriods
        case lineID = "lineId"
        case reason, disruption
    }
}

// MARK: - Disruption
struct Disruption: Codable {
    let type, category, categoryDescription, description, closureText: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case category, categoryDescription, description, closureText
    }
}

// MARK: - ServiceType
struct ServiceType: Codable {
    let type: String
    let name: String
    let uri: String

    enum CodingKeys: String, CodingKey {
        case type = "$type"
        case name, uri
    }
}

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
