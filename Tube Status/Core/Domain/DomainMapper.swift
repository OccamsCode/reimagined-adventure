//
//  DomainMapper.swift
//  Tube Status
//
//  Created by Brian Munjoma on 08/11/2023.
//

import Foundation

struct DomainMapper {
    
    static func map(_ object: LineModeStatusElement) -> LineDetails {
        
        let status = object.lineStatuses ?? []
        
        return .init(id: object.id,
                     name: object.name,
                     lineStatus: status.map({ DomainMapper.map($0) })
        )
        
    }
    
    static func map(_ object: LineStatus) -> LineStatusDetails {
        return .init(id: object.id,
                     statusServerity: object.statusSeverity,
                     statusSeverityDescription: object.statusSeverityDescription,
                     reason: object.reason)
    }
    
}
