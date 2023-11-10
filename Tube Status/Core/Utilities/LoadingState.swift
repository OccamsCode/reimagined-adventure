//
//  LoadingState.swift
//  Tube Status
//
//  Created by Brian Munjoma on 10/11/2023.
//

import Foundation

enum LoadingState: Equatable {
    
    case idle
    case loading
    case failed(Error)
    case success
    
    static func == (lhs: LoadingState, rhs: LoadingState) -> Bool {
        switch (lhs, rhs) {
        case (.idle, .idle): return true
        case (.loading, .loading): return true
        case (.failed(_), .failed(_)): return true
        case (.success, .success): return true
        default: return false
        }
    }
}
