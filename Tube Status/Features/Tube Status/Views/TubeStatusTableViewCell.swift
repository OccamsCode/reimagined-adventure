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
        tubeNameLabel.text = nil
        tubeStatusLabel.text = nil
    }
    
    func update(using model: LineDetails) {
        
        tubeNameLabel.text = model.name
        tubeStatusLabel.text = model.lineStatus
            .map { $0.reason ?? $0.statusSeverityDescription }
            .joined(separator: "\n")
    }
}
