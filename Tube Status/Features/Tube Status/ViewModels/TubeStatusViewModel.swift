//
//  TubeStatusViewModel.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation
import Injection
import Poppify

final class TubeStatusViewModel {
    
    let repository: TubeStatusRepositoryProtocol
    private (set) var loadingState: LoadingState
    private var lineDetails: [LineDetails]
    
    init(_ repository: TubeStatusRepositoryProtocol, loadingState: LoadingState = .idle) {
        self.repository = repository
        self.lineDetails = []
        self.loadingState = loadingState
    }
    
    func fetchAllStatus(_ completion: @escaping () -> Void) {
        loadingState = .loading
        lineDetails.removeAll()
        repository.fetchTubeStatus { [unowned self] result in
            switch result {
            case .success(let success):
                self.lineDetails = success
                self.loadingState = .success
            case .failure(let failure):
                print(failure.localizedDescription)
                self.loadingState = .failed(failure)
            }
            completion()
        }
    }
    
    var numberOfSections: Int {
        switch loadingState {
        case .loading: return 1
        default: return lineDetails.isEmpty ? 0 : 1
        }
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        switch loadingState {
        case .loading: return 10
        default:
            if section < 0 || section >= numberOfSections { return 0 }
            return lineDetails.count
        }
    }
    
    func object(at indexPath: IndexPath) -> LineDetails? {
        switch loadingState {
        case .loading: return nil
        default:
            if indexPath.row < 0 || indexPath.row >= numberOfItems(inSection: indexPath.section) { return nil }
            return lineDetails[indexPath.row]
        }
    }
}
