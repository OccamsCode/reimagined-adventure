//
//  MockError.swift
//  App Tests
//
//  Created by Brian Munjoma on 08/11/2023.
//

@testable import Poppify

import Foundation

enum MockError: Error {
    case err
}

class MockEnvironment: EnvironmentType {

    var scheme: HTTP.Scheme = .unsecure
    var endpoint: String = ""
    var additionalHeaders: [String : String] = [:]
    var port: Int? = nil
    var secret: Secret? = nil
    
}

class MockURLSession: URLSessionType {

    var data: Data?
    var response: URLResponse?
    var error: Error?

    func dataTask(with request: URLRequest,
                  completion: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionTaskType {
        return MockTask {
            completion(self.data, self.response, self.error)
        }
    }
    
    func sendRequest(for request: URLRequest) async throws -> (Data, URLResponse) {
        return (data!, response!)
    }

}

class MockClient<T: Decodable>: Client {
    
    enum State {
        case error, data
    }

    var state: State = .data
    var item: T!
    var environment: EnvironmentType
    var urlSession: URLSessionType

    init(environment: EnvironmentType = MockEnvironment(), urlSession: URLSessionType = MockURLSession()) {
        self.environment = environment
        self.urlSession = urlSession
    }

    func executeRequest<T>(with resource: Resource<T>,
                     completion: @escaping (Result<T, RequestError>) -> Void) -> URLSessionTaskType? where T : Decodable {
        switch state {
        case .error:
            return MockTask{ completion(.failure(.response(error: MockError.err))) }
        case .data:
            let type = type(of: self)
            let bundle = Bundle(for: type.self)
            let path = bundle.url(forResource: "RemoteLineModeStatus", withExtension: "json")!
            let data = try! Data(contentsOf: path)
            let coded = try! resource.decode(data)
            return MockTask{ completion(.success(coded)) }
        }
    }
    
}

class MockTask: URLSessionTaskType {

    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    func resume() {
        closure()
    }
}
