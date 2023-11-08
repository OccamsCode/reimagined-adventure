//
//  TubeStatusRepositoryTests.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

import XCTest
@testable import Tube_Status
@testable import Poppify

final class TubeStatusRepositoryTests: XCTestCase {

    private var sut: TubeStatusRepository!
    private var client: MockClient<RemoteLineModeStatus>!
    
    override func setUp() {
        client = MockClient()
        sut = TubeStatusRepository()
        sut.client = client
    }

    override func tearDown() {
        client = nil
        sut = nil
    }
    
    func testClientHasData_fetchTubeStatus_returnsMappedData() {

        client.state = .data

        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        var result: [LineDetails]?

        sut.fetchTubeStatus { expected in
            
            switch expected {
            case .success(let success):
                result = success
            default: break
            }
            expectFetchTubeStatus.fulfill()
        }
        
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        XCTAssertNotNil(result)
    }
    
    func testClientHasNoData_fetchTubeStatus_returnsError() {

        client.state = .error

        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        var result: Error?

        sut.fetchTubeStatus { expected in
            
            switch expected {
            case .failure(let failed):
                result = failed
            default: break
            }
            expectFetchTubeStatus.fulfill()
        }
        
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        XCTAssertNotNil(result)
    }

}
