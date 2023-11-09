//
//  RemoteLineStatusTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 07/11/2023.
//

import XCTest
@testable import Tube_Status

final class RemoteLineStatusTests: XCTestCase {

    func testDecodingCrowding() throws {
        try decodeModel { (model: Crowding) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities")
        }
    }

    func testDecodingValidityPeriod() throws {
        try decodeModel { (model: ValidityPeriod) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.ValidityPeriod, Tfl.Api.Presentation.Entities")
            XCTAssertEqual(model.fromDate, "2023-11-07T11:03:13Z")
            XCTAssertEqual(model.toDate, "2023-11-08T01:29:00Z")
            XCTAssertEqual(model.isNow, true)
        }
    }
    
    func testDecodingServiceType() throws {
        try decodeModel { (model: ServiceType) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.LineServiceTypeInfo, Tfl.Api.Presentation.Entities")
            XCTAssertEqual(model.name, "Night")
            XCTAssertEqual(model.uri, "/Line/Route?ids=Central&serviceTypes=Night")
        }
    }
    
    func testDecodingDisruption() throws {
        try decodeModel { (model: Disruption) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.Disruption, Tfl.Api.Presentation.Entities")
            XCTAssertEqual(model.category, "RealTime")
            XCTAssertEqual(model.categoryDescription, "RealTime")
            XCTAssertEqual(model.description, "Central Line: Minor delays due to an earlier signal failure at St. Paul's. ")
            XCTAssertEqual(model.closureText, "minorDelays")
        }
    }
    
    func testDecodingLineStatus() throws {
        try decodeModel { (model: LineStatus) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.LineStatus, Tfl.Api.Presentation.Entities")
            XCTAssertEqual(model.id, 0)
            XCTAssertEqual(model.lineID, "central")
            XCTAssertEqual(model.statusSeverity, 9)
            XCTAssertEqual(model.statusSeverityDescription, "Minor Delays")
            XCTAssertEqual(model.reason, "Central Line: Minor delays due to an earlier signal failure at St. Paul's. ")
            XCTAssertEqual(model.created, "0001-01-01T00:00:00")
            XCTAssertNotNil(model.validityPeriods)
            XCTAssertNotNil(model.disruption)
        }
    }
    
    func testDecodingLineModeStatusElement() throws {
        try decodeModel { (model: LineModeStatusElement) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.Line, Tfl.Api.Presentation.Entities")
            XCTAssertEqual(model.id, "central")
            XCTAssertEqual(model.name, "Central")
            XCTAssertEqual(model.modeName, "tube")
            XCTAssertEqual(model.created, "2023-10-31T15:28:42.2Z")
            XCTAssertEqual(model.modified, "2023-10-31T15:28:42.2Z")
            XCTAssertNotNil(model.lineStatuses)
            XCTAssertNotNil(model.serviceTypes)
            XCTAssertNotNil(model.crowding)
        }
    }
}
