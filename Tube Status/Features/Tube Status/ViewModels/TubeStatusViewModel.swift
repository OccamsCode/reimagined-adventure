//
//  TubeStatusViewModel.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Injection
import Poppify

final class TubeStatusViewModel {
    
    @Injected(\.clientProvider) var client
    let repository: TubeStatusRepositoryProtocol
    
    init(_ repository: TubeStatusRepositoryProtocol) {
        self.repository = repository
    }
}
