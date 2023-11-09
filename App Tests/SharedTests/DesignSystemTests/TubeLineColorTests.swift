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
        
        XCTAssertEqual(result, UIColor(rgb: 0x894D24))
    }
    
    func testCentralID_lineColor_isCorect() {
        
        let identification = "central"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0xCA392D))
    }
    
    func testCircleID_lineColor_isCorect() {
        
        let identification = "circle"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0xF7D046))
    }
    
    func testDistrictID_lineColor_isCorect() {
        
        let identification = "district"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x307033))
    }
    
    func testHammersmithAndCityID_lineColor_isCorect() {
        
        let identification = "hammersmith-city"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0xCD9BAE))
    }
    
    func testJubileeID_lineColor_isCorect() {
        
        let identification = "jubilee"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x888E96))
    }
    
    func testMetropolitan_lineColor_isCorect() {
        
        let identification = "metropolitan"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x6B1A53))
    }
    
    func testNorthernID_lineColor_isCorect() {
        
        let identification = "northern"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x000000))
    }
    
    func testPiccadillyID_lineColor_isCorect() {
        
        let identification = "piccadilly"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x0A18A1))
    }
    
    func testVictoriaID_lineColor_isCorect() {
        
        let identification = "victoria"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x479EDD))
    }
    
    func testWaterlooAndCityID_lineColor_isCorect() {
        
        let identification = "waterloo-city"
        let result = UIColor.lineColor(id: identification)
        
        XCTAssertEqual(result, UIColor(rgb: 0x8CCDBD))
    }


}
