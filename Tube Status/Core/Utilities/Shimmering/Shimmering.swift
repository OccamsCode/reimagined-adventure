//
//  Shimmering.swift
//  Tube Status
//
//  Created by Brian Munjoma on 10/11/2023.
//

import UIKit.UIView

protocol Shimmering where Self: UIView {
    var shimmeringAnimatedItems: [UIView] { get }
    var excludedItems: Set<UIView> { get }
}

extension Shimmering {
    var shimmeringAnimatedItems: [UIView] { [self] }
    var excludedItems: Set<UIView> { [] }
}
