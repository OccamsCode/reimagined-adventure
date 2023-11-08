//
//  AppCordinatorTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import XCTest
@testable import Tube_Status

final class AppCordinatorTests: XCTestCase {

    func test_InitialAppCoordinator_HasNoChildren() {

        // Given
        let sut = AppCoordinator(UIWindow())

        // When
        let result = sut.childCoordinators.count

        // Then
        XCTAssertEqual(result, 0)
    }

    func test_AppCoordinatorOnStart_HasOneChild() {

        // Given
        let sut = AppCoordinator(UIWindow())
        sut.start()

        // When
        let result = sut.childCoordinators.count

        // Then
        XCTAssertEqual(result, 1)
    }

}
