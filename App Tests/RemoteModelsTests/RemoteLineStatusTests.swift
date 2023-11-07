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
        try decodeModel() { (model: Crowding) in
            XCTAssertEqual(model.type, "Tfl.Api.Presentation.Entities.Crowding, Tfl.Api.Presentation.Entities")
        }
    }

}
