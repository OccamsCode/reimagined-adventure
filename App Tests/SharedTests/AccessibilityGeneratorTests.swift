//
//  AccessibilityGeneratorTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 09/11/2023.
//

import XCTest
@testable import Tube_Status

final class AccessibilityGeneratorTests: XCTestCase {

    func testLineDetailsWithNoStatus_generate_isNil() {
        
        let lineDetail = LineDetails(id: "id", name: "name", lineStatus: [])
        
        let result = AccessibilityGenerator.generate(lineDetail)
        
        XCTAssertNil(result)
    }
    
    func testLineDetailsWithNoReason_generate_isCorrect() {
        
        let lineDetail = LineDetails(id: "id", name: "Name", lineStatus: [
            LineStatusDetails(id: 0, statusServerity: 10, statusSeverityDescription: "Good Service", reason: nil)
            ])
        
        let result = AccessibilityGenerator.generate(lineDetail)
        
        XCTAssertEqual(result, "Good Service on the Name line")
    }
    
    func testLineDetailsWithReason_generate_isCorrect() {
        
        let lineDetail = LineDetails(id: "id", name: "Name", lineStatus: [
            LineStatusDetails(id: 0, statusServerity: 9, statusSeverityDescription: "Minor Delays", reason: "Waterloo and City Line: Minor delays due to an earlier points failure at Bank.")
            ])
        
        let result = AccessibilityGenerator.generate(lineDetail)
        
        XCTAssertEqual(result, "Waterloo and City Line: Minor delays due to an earlier points failure at Bank.")
    }

}
