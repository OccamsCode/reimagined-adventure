//
//  TubeStatusViewModelTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import XCTest
@testable import Tube_Status

final class TubeStatusViewModelTests: XCTestCase {

    private var sut: TubeStatusViewModel!
    private var respository: MockTubeStatusRepository!
    
    override func setUp() {
        respository = MockTubeStatusRepository()
        sut = TubeStatusViewModel(respository)
    }

    override func tearDown() {
        sut = nil
    }
    
    func testInitialViewModel_numberOfSection_isZero() {
        
        let result = sut.numberOfSections
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsSingleItem_numberOfSections_isOne() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfSections
        
        XCTAssertEqual(result, 1)
    }
    
    func testFetchAllStatusesReturnsMultipleItems_numberOfSections_isOne() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 3)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfSections
        
        XCTAssertEqual(result, 1)
    }

}

class MocksGenerator {

    static func createLineDetails(_ count: Int) -> [LineDetails] {
        return Array(0..<count).map {
            LineDetails(id: String($0),
                        name: "Named: \($0)",
                        lineStatus: [
                            LineStatusDetails(id: $0,
                                              statusServerity: $0,
                                              statusSeverityDescription: "servirity",
                                              reason: nil)
                        ])
        }
    }

}

final class MockTubeStatusRepository: TubeStatusRepositoryProtocol {
    
    enum State {
        case error
        case data(count: Int)
    }
    
    var state: State = .error
    
    func fetchTubeStatus(_ completion: @escaping (Result<[LineDetails], Error>) -> Void) {
        
        switch state {
        case .data(let count):
            completion(.success(MocksGenerator.createLineDetails(count)))
        case .error:
            completion(.failure(MockError.err))
        }
    }
}
