//
//  ShimmerConstants.swift
//  Tube Status
//
//  Created by Brian Munjoma on 10/11/2023.
//

import UIKit.UIColor

struct ShimmerKey {
    static let shimmer = "Key.ShimmerLayer"
    static let template = "Key.TemplateLayer"
}

struct Color {
    enum Placeholder {
        static let light = UIColor(red: 216/255, green: 216/255, blue: 216/255, alpha: 1.0)
        static let dark = UIColor(red: 51/255, green: 51/255, blue: 51/255, alpha: 1.0)
    }
}
