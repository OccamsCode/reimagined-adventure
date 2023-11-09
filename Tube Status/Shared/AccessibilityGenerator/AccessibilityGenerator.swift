//
//  AccessibilityGenerator.swift
//  Tube Status
//
//  Created by Brian Munjoma on 09/11/2023.
//

import Foundation

struct AccessibilityGenerator {
    static func generate(_ model: LineDetails) -> String? {
        guard let lineStatus = model.lineStatus.first else {
           return nil
        }
        
        if let reason = lineStatus.reason {
            return reason
        }
        
        return "\(lineStatus.statusSeverityDescription) on the \(model.name) line"
    }
}
