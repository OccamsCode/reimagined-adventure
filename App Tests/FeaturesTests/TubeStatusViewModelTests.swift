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
        respository = nil
    }
    
    // MARK: - numberOfSections Tests
    func testInitialViewModel_numberOfSections_isZero() {
        
        let result = sut.numberOfSections
        
        XCTAssertEqual(result, 0)
    }
    
    func testLoadingStateLoading_numberOfSections_isTen() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        
        let result = sut.numberOfSections
        
        XCTAssertEqual(result, 10)
    }
    
    func testLoadingStateFailed_numberOfSections_isZero() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        
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
    
    // MARK: - numberOfItems(inSection:) Tests
    func testInitialViewModel_numberOfItemInSectionZero_isZero() {
        
        let result = sut.numberOfItems(inSection: 0)
        
        XCTAssertEqual(result, 0)
    }
    
    func testInitialViewModel_numberOfItemInSectionNegative_isZero() {
        
        let result = sut.numberOfItems(inSection: -1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testInitialViewModel_numberOfItemInSectionOne_isZero() {
        
        let result = sut.numberOfItems(inSection: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testInitialViewModel_numberOfItemInSectionThree_isZero() {
        
        let result = sut.numberOfItems(inSection: 3)
        
        XCTAssertEqual(result, 0)
    }
    
    func testLoadingStateLoading_numberOfItemInSectionZero_isTen() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let result = sut.numberOfItems(inSection: 0)
        
        XCTAssertEqual(result, 10)
    }
    
    func testLoadingStateLoading_numberOfItemInSectionNegative_isTen() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let result = sut.numberOfItems(inSection: -1)
        
        XCTAssertEqual(result, 10)
    }
    
    func testLoadingStateLoading_numberOfItemInSectionOne_isTen() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let result = sut.numberOfItems(inSection: 1)
        
        XCTAssertEqual(result, 10)
    }
    
    func testLoadingStateLoading_numberOfItemInSectionThree_isTen() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let result = sut.numberOfItems(inSection: 3)
        
        XCTAssertEqual(result, 10)
    }
    
    func testLoadingStateFailed_numberOfItemInSectionZero_isZero() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let result = sut.numberOfItems(inSection: 0)
        
        XCTAssertEqual(result, 0)
    }
    
    func testLoadingStateFailed_numberOfItemInSectionNegative_isZero() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let result = sut.numberOfItems(inSection: -1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testLoadingStateFailed_numberOfItemInSectionOne_isZero() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let result = sut.numberOfItems(inSection: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testLoadingStateFailed_numberOfItemInSectionThree_isZero() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let result = sut.numberOfItems(inSection: 3)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsSingleItem_numberOfItemsInSectionZero_isOne() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 0)
        
        XCTAssertEqual(result, 1)
    }
    
    func testFetchAllStatusesReturnsSingleItem_numberOfItemsInSectionNegative_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: -1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsSingleItem_numberOfItemsInSectionOne_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsSingleItem_numberOfItemsInSectionThree_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 3)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsMultipleItems_numberOfItemsInSectionZero_isThree() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 3)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 0)
        
        XCTAssertEqual(result, 3)
    }
    
    func testFetchAllStatusesReturnsMultipleItems_numberOfItemsInSectionNegative_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 3)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: -1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsMultipleItems_numberOfItemsInSectionOne_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 3)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 1)
        
        XCTAssertEqual(result, 0)
    }
    
    func testFetchAllStatusesReturnsMultipleItems_numberOfItemsInSectionThree_isZero() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 3)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.numberOfItems(inSection: 3)
        
        XCTAssertEqual(result, 0)
    }

    // MARK: - object(at: indexPath) Tests
    func testInitialViewModel_objectAtIndexPathZero_isNil() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testInitialViewModel_objectAtIndexPath_sectionNegativeRowZero_isNil() {
        
        let indexPath = IndexPath(row: 0, section: -1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testInitialViewModel_objectAtIndexPath_sectionZeroRowNegative_isNil() {
        
        let indexPath = IndexPath(row: -1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testInitialViewModel_objectAtIndexPath_sectionOneRowZero_isNil() {
        
        let indexPath = IndexPath(row: 0, section: 1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testInitialViewModel_objectAtIndexPath_sectionZeroRowOne_isNil() {
        
        let indexPath = IndexPath(row: 1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateLoading_objectAtIndexPathZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateLoading_objectAtIndexPath_sectionNegativeRowZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let indexPath = IndexPath(row: 0, section: -1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateLoading_objectAtIndexPath_sectionZeroRowNegative_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let indexPath = IndexPath(row: -1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateLoading_objectAtIndexPath_sectionOneRowZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let indexPath = IndexPath(row: 0, section: 1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateLoading_objectAtIndexPath_sectionZeroRowOne_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .loading)
        let indexPath = IndexPath(row: 1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateFailed_objectAtIndexPathZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateFailed_objectAtIndexPath_sectionNegativeRowZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let indexPath = IndexPath(row: 0, section: -1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateFailed_objectAtIndexPath_sectionZeroRowNegative_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let indexPath = IndexPath(row: -1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateFailed_objectAtIndexPath_sectionOneRowZero_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let indexPath = IndexPath(row: 0, section: 1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testLoadingStateFailed_objectAtIndexPath_sectionZeroRowOne_isNil() {
        
        sut = TubeStatusViewModel(respository, loadingState: .failed(MockError.err))
        let indexPath = IndexPath(row: 1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testFetchAllStatusesReturnsSingleItem_objectAtIndexPathZero_isNotNil() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let indexPath = IndexPath(row: 0, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNotNil(result)
    }
    
    func testFetchAllStatusesReturnsSingleItem_objectAtIndexPath_sectionNegativeRowZero_isNil() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let indexPath = IndexPath(row: 0, section: -1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testFetchAllStatusesReturnsSingleItem_objectAtIndexPath_sectionZeroRowNegative_isNil() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let indexPath = IndexPath(row: -1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testFetchAllStatusesReturnsSingleItem_objectAtIndexPath_sectionOneRowZero_isNil() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let indexPath = IndexPath(row: 0, section: 1)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    func testFetchAllStatusesReturnsSingleItem_objectAtIndexPath_sectionZeroRowOne_isNil() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let indexPath = IndexPath(row: 1, section: 0)
        let result = sut.object(at: indexPath)
        
        XCTAssertNil(result)
    }
    
    // MARK: - Loading State Tests
    
    func testIntialViewModel_loadingState_isIdle() {
        
        let result = sut.loadingState
        
        XCTAssertEqual(result, .idle)
    }
    
    func testRepostitoryReturnsData_loadingState_isSuccess() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .data(count: 1)
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.loadingState
        
        XCTAssertEqual(result, .success)
    }
    
    func testRepostitoryReturnsError_loadingState_isFailed() {
        
        let expectFetchTubeStatus = expectation(description: "Fetch Tube Status")
        
        respository.state = .error
        sut.fetchAllStatus { expectFetchTubeStatus.fulfill() }
        wait(for: [expectFetchTubeStatus], timeout: 1.0)
        
        let result = sut.loadingState
        
        XCTAssertEqual(result, .failed(MockError.err))
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
