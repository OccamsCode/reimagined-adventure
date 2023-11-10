//
//  TubeLineColorTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 09/11/2023.
//

import XCTest
@testable import Tube_Status

final class TubeLineColorTests: XCTestCase {

    func testBakerlooID_lineColor_isCorect() {
        
        let identification = "bakerloo"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testCentralID_lineColor_isCorect() {
        
        let identification = "central"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testCircleID_lineColor_isCorect() {
        
        let identification = "circle"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testDistrictID_lineColor_isCorect() {
        
        let identification = "district"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testHammersmithAndCityID_lineColor_isCorect() {
        
        let identification = "hammersmith-city"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testJubileeID_lineColor_isCorect() {
        
        let identification = "jubilee"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testMetropolitan_lineColor_isCorect() {
        
        let identification = "metropolitan"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testNorthernID_lineColor_isCorect() {
        
        let identification = "northern"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testPiccadillyID_lineColor_isCorect() {
        
        let identification = "piccadilly"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testVictoriaID_lineColor_isCorect() {
        
        let identification = "victoria"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }
    
    func testWaterlooAndCityID_lineColor_isCorect() {
        
        let identification = "waterloo-city"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(named: identification))
    }

    func testIncorrectID_lineColor_isNil() {
        
        let identification = "Underground"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertNil(result)
    }

}
