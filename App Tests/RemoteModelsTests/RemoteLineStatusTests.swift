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
}
