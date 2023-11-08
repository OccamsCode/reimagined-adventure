//
//  TubeStatusFlowCoordinatorTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import XCTest
@testable import Tube_Status

final class TubeStatusFlowCoordinatorTests: XCTestCase {
    
    var sut: TubeStatusFlowCoordinator!
    
    override func setUp() {
        sut = TubeStatusFlowCoordinator(UINavigationController())
    }
    
    override func tearDown() {
        sut = nil
    }

    func test_InitialHomeFlowCoordinator_HasNoChildren() {

        // When
        let result = sut.childCoordinators.count

        // Then
        XCTAssertEqual(result, 0)
    }

    func test_HomeFlowCoordinatorOnStart_HasNoChildren() {

        // Given
        sut.start()

        // When
        let result = sut.childCoordinators.count

        // Then
        XCTAssertEqual(result, 0)
    }

}
