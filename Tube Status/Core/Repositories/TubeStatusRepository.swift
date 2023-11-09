//
//  TubeStatusRepository.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Injection
import Poppify

protocol TubeStatusRepositoryProtocol {
    func fetchTubeStatus(_ completion: @escaping (Result<[LineDetails], Error>) -> Void)
}

final class TubeStatusRepository {
    @Injected(\.clientProvider) var client
}

extension TubeStatusRepository: TubeStatusRepositoryProtocol {
    
    func fetchTubeStatus(_ completion: @escaping (Result<[LineDetails], Error>) -> Void) {
        
        let request = LineModeStatusRequest(.tube)
        let resource = Resource<RemoteLineModeStatus>(request: request)
        
        let task = client.executeRequest(with: resource) { result in
            switch result {
            case .success(let remoteObject):
                let domainObject = remoteObject.map { DomainMapper.map($0) }
                completion(.success(domainObject))
            case .failure(let error):
                completion(.failure(error))
            }
        }
        task?.resume()
    }
}
