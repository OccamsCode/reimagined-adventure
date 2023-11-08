//
//  DomainMapperTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import XCTest
@testable import Tube_Status

final class DomainMapperTests: XCTestCase {

    func test_MapLineStatus_to_LineStatusDetails() {
        
        let object = LineStatus(type: "type",
                                id: Int.max,
                                statusSeverity: Int.min,
                                statusSeverityDescription: "desc",
                                created: "n/a",
                                validityPeriods: nil,
                                lineID: nil,
                                reason: "reason",
                                disruption: nil)
        
        let result = DomainMapper.map(object)
        
        XCTAssertEqual(result.id, object.id)
        XCTAssertEqual(result.statusServerity, object.statusSeverity)
        XCTAssertEqual(result.statusSeverityDescription, object.statusSeverityDescription)
        XCTAssertEqual(result.reason, object.reason)
    }
    
    func test_MapLineStatusWithNilReason_to_LineStatusDetails() {
        
        let object = LineStatus(type: "type",
                                id: Int.max,
                                statusSeverity: Int.min,
                                statusSeverityDescription: "desc",
                                created: "n/a",
                                validityPeriods: nil,
                                lineID: nil,
                                reason: nil,
                                disruption: nil)
        
        let result = DomainMapper.map(object)
        
        XCTAssertEqual(result.id, object.id)
        XCTAssertEqual(result.statusServerity, object.statusSeverity)
        XCTAssertEqual(result.statusSeverityDescription, object.statusSeverityDescription)
        XCTAssertEqual(result.reason, object.reason)
    }
    
    func test_MapLineModeStatusElement_to_LineDetails() {
        
        let object = LineModeStatusElement(type: "type",
                                           id: "id",
                                           name: "name",
                                           modeName: "mode",
                                           disruptions: nil,
                                           created: "now",
                                           modified: "now",
                                           lineStatuses: nil,
                                           serviceTypes: nil,
                                           crowding: nil)
        
        let result = DomainMapper.map(object)
        
        XCTAssertEqual(result.id, object.id)
        XCTAssertEqual(result.name, object.name)
        XCTAssertEqual(result.lineStatus.isEmpty, true)
    }
    
    func test_MapLineModeStatusElementWithLineStatus_to_LineDetails() {
        
        let lineStatus = LineStatus(type: "type",
                                    id: Int.max,
                                    statusSeverity: Int.min,
                                    statusSeverityDescription: "desc",
                                    created: "n/a",
                                    validityPeriods: nil,
                                    lineID: nil,
                                    reason: "reason",
                                    disruption: nil)
        
        let object = LineModeStatusElement(type: "type",
                                           id: "id",
                                           name: "name",
                                           modeName: "mode",
                                           disruptions: nil,
                                           created: "now",
                                           modified: "now",
                                           lineStatuses: [lineStatus],
                                           serviceTypes: nil,
                                           crowding: nil)
        
        let result = DomainMapper.map(object)
        
        XCTAssertEqual(result.id, object.id)
        XCTAssertEqual(result.name, object.name)
        XCTAssertEqual(result.lineStatus.count, 1)
    }
}

