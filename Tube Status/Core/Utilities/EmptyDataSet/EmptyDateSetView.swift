//
//  EmptyDateSetView.swift
//  Tube Status
//
//  Created by Brian Munjoma on 10/11/2023.
//

import UIKit

class EmptyDataSetView: UIView {
    
    internal lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = UIColor.clear
        contentView.isUserInteractionEnabled = true
        contentView.alpha = 0
        return contentView
    }()
    
    internal lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = UIColor.clear
        
        titleLabel.font = UIFont.systemFont(ofSize: 27.0)
        titleLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        titleLabel.textAlignment = .center
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.accessibilityIdentifier = "empty set title"
        self.contentView.addSubview(titleLabel)
        return titleLabel
    }()
    
    internal lazy var detailLabel: UILabel = {
        let detailLabel = UILabel()
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.backgroundColor = UIColor.clear
        
        detailLabel.font = UIFont.systemFont(ofSize: 17.0)
        detailLabel.textColor = UIColor(white: 0.6, alpha: 1.0)
        detailLabel.textAlignment = .center
        detailLabel.lineBreakMode = .byWordWrapping
        detailLabel.numberOfLines = 0
        detailLabel.accessibilityIdentifier = "empty set detail label"
        self.contentView.addSubview(detailLabel)
        return detailLabel
    }()
    
    internal lazy var button: UIButton = {
        let button = UIButton.init(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.clear
        button.contentHorizontalAlignment = .center
        button.contentVerticalAlignment = .center
        button.accessibilityIdentifier = "empty set button"
        
        self.contentView.addSubview(button)
        return button
    }()
    
    private var canShowTitle: Bool {
        if let attributedText = titleLabel.attributedText {
            return attributedText.length > 0
        }
        return false
    }
    
    private var canShowDetail: Bool {
        if let attributedText = detailLabel.attributedText {
            return attributedText.length > 0
        }
        return false
    }
    
    private var canShowButton: Bool {
        if let attributedTitle = button.attributedTitle(for: .normal) {
            return attributedTitle.length > 0
        } else if let _ = button.image(for: .normal) {
            return true
        }
        
        return false
    }
    
    internal var fadeInOnDisplay = false
    internal var verticalOffset: CGFloat = 0
    internal var verticalSpace: CGFloat = 11
    
    internal var didTapDataButtonHandle: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(contentView)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override public func didMoveToSuperview() {
        if let superviewBounds = superview?.bounds {
            frame = CGRect(x: 0, y: 0, width: superviewBounds.width, height: superviewBounds.height)
        }
        if fadeInOnDisplay {
            UIView.animate(withDuration: 0.25) {
                self.contentView.alpha = 1
            }
        } else {
            contentView.alpha = 1
        }
    }
    
    // MARK: - Action Methods
    
    internal func removeAllConstraints() {
        removeConstraints(constraints)
        contentView.removeConstraints(contentView.constraints)
    }
    
    internal func prepareForReuse() {
        titleLabel.text = nil
        detailLabel.text = nil
        button.setAttributedTitle(nil, for: .normal)
        button.setAttributedTitle(nil, for: .highlighted)
        
        removeAllConstraints()
    }
    
    
    // MARK: - Auto-Layout Configuration
    internal func setupConstraints() {
        
        // First, configure the content view constaints
        // The content view must alway be centered to its superview
        let centerXConstraint = NSLayoutConstraint(item: contentView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0.0)
        let centerYConstraint = NSLayoutConstraint(item: contentView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0.0)
        
        self.addConstraints([centerXConstraint, centerYConstraint])
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[contentView]|", options: [], metrics: nil, views: ["contentView": contentView]))

        // When a custom offset is available, we adjust the vertical constraints' constants
        if (verticalOffset != 0 && constraints.count > 0) {
            centerYConstraint.constant = verticalOffset
        }
        
        let width = frame.width > 0 ? frame.width : UIScreen.main.bounds.width
        let padding = roundf(Float(width/16.0))
        let verticalSpace = self.verticalSpace  // Default is 11 pts
        
        var subviewStrings: [String] = []
        var views: [String: UIView] = [:]
        let metrics = ["padding": padding]
        
        // Assign the title label's horizontal constraints
        if (canShowTitle) {
            titleLabel.isHidden = false
            subviewStrings.append("titleLabel")
            views[subviewStrings.last!] = titleLabel
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[titleLabel(>=0)]-(padding)-|", options: [], metrics: metrics, views: views))
        } else {
            titleLabel.isHidden = true
        }
        
        // Assign the detail label's horizontal constraints
        if (canShowDetail) {
            detailLabel.isHidden = false
            subviewStrings.append("detailLabel")
            views[subviewStrings.last!] = detailLabel
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[detailLabel(>=0)]-(padding)-|", options: [], metrics: metrics, views: views))
        } else {
            detailLabel.isHidden = true
        }
        
        // Assign the button's horizontal constraints
        if (canShowButton) {
            button.isHidden = false
            subviewStrings.append("button")
            views[subviewStrings.last!] = button
            
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-(padding)-[button(>=0)]-(padding)-|", options: [], metrics: metrics, views: views))
        } else {
            button.isHidden = true
        }
        
        var verticalFormat = String()
        
        // Build a dynamic string format for the vertical constraints, adding a margin between each element. Default is 11 pts.
        for i in 0 ..< subviewStrings.count {
            let string = subviewStrings[i]
            verticalFormat += "[\(string)]"
            
            if i < subviewStrings.count - 1 {
                verticalFormat += "-(\(verticalSpace))-"
            }
        }
        
        // Assign the vertical constraints to the content view
        if !verticalFormat.isEmpty {
            contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|\(verticalFormat)|", options: [], metrics: metrics, views: views))
        }
        
    }
    
}

extension EmptyDataSetView {
    
    /// Asks the data source for the title of the dataset.
    /// The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
    @discardableResult
    public func titleLabelString(_ attributedString: NSAttributedString?) -> Self {
        titleLabel.attributedText = attributedString
        return self
    }
    
    /// Asks the data source for the description of the dataset.
    /// The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
    @discardableResult
    public func detailLabelString(_ attributedString: NSAttributedString?) -> Self {
        detailLabel.attributedText = attributedString
        return self
    }
    
    /// Asks the data source for the title to be used for the specified button state.
    /// The dataset uses a fixed font style by default, if no attributes are set. If you want a different font style, return a attributed string.
    @discardableResult
    public func buttonTitle(_ buttonTitle: NSAttributedString?, for state: UIControl.State) -> Self {
        button.setAttributedTitle(buttonTitle, for: state)
        return self
    }
    
    /// Asks the data source for the background color of the dataset. Default is clear color.
    @discardableResult
    public func dataSetBackgroundColor(_ backgroundColor: UIColor?) -> Self {
        self.backgroundColor = backgroundColor
        return self
    }
    
    /// Tells the delegate that the action button was tapped.
    @discardableResult
    public func didTapDataButton(_ closure: @escaping () -> (Void)) -> Self {
        didTapDataButtonHandle = closure
        return self
    }
    
}

