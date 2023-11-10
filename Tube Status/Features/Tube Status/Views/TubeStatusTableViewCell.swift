//
//  TubeStatusTableViewCell.swift
//  Tube Status
//
//  Created by Brian Munjoma on 09/11/2023.
//

import UIKit

class TubeStatusTableViewCell: UITableViewCell {
    
    @IBOutlet private var tubeColorView: UIView!
    @IBOutlet private var tubeNameLabel: UILabel!
    @IBOutlet private var tubeStatusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func update(using model: LineDetails) {
        
        tubeColorView.backgroundColor = .lineColor(id: model.id)
        tubeNameLabel.text = model.name
        tubeStatusLabel.text = model.lineStatus
            .map { $0.reason ?? $0.statusSeverityDescription }
            .joined(separator: "\n")
        
        accessibilityLabel = AccessibilityGenerator.generate(model)
    }
}

extension TubeStatusTableViewCell: Shimmering {
    var shimmeringAnimatedItems: [UIView] {
        [
            tubeColorView,
            tubeNameLabel,
            tubeStatusLabel
        ]
    }
}
