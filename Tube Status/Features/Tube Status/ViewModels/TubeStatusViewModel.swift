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
        
        repository.fetchTubeStatus { [unowned self] result in
            switch result {
            case .success(let success):
                self.lineDetails = success
            case .failure(let failure):
                print(failure)
            }
            completion()
        }
    }
    
    var numberOfSections: Int {
        return lineDetails.isEmpty ? 0 : 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        if section < 0 || section >= numberOfSections { return 0 }
        return lineDetails.count
    }
    
    func object(at indexPath: IndexPath) -> LineDetails? {
        if indexPath.row < 0 || indexPath.row >= numberOfItems(inSection: indexPath.section) { return nil }
        return lineDetails[indexPath.row]
    }
}
