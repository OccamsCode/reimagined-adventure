//
//  EmptyDataSet.swift
//  Tube Status
//
//  Created by Brian Munjoma on 10/11/2023.
//

import UIKit

class WeakObjectContainer: NSObject {
    weak var weakObject: AnyObject?
    
    init(with weakObject: Any?) {
        super.init()
        self.weakObject = weakObject as AnyObject?
    }
}

private var kEmptyDataSetView =             "emptyDataSetView"
private var kConfigureEmptyDataSetView =    "configureEmptyDataSetView"

extension UIScrollView: UIGestureRecognizerDelegate {
    
    private var configureEmptyDataSetView: ((EmptyDataSetView) -> Void)? {
        get {
            return objc_getAssociatedObject(self, &kConfigureEmptyDataSetView) as? (EmptyDataSetView) -> Void
        }
        set {
            objc_setAssociatedObject(self, &kConfigureEmptyDataSetView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            UIScrollView.swizzleReloadData
            if self is UITableView {
                UIScrollView.swizzleEndUpdates
            }
        }
    }
    
    var isEmptyDataSetVisible: Bool {
        if let view = objc_getAssociatedObject(self, &kEmptyDataSetView) as? EmptyDataSetView {
            return !view.isHidden
        }
        return false
    }
    
    //MARK: - privateProperty
    func emptyDataSetView(_ closure: @escaping (EmptyDataSetView) -> Void) {
        configureEmptyDataSetView = closure
    }
    
    private var emptyDataSetView: EmptyDataSetView? {
        get {
            if let view = objc_getAssociatedObject(self, &kEmptyDataSetView) as? EmptyDataSetView {
                return view
            } else {
                let view = EmptyDataSetView.init(frame: frame)
                view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
                view.isHidden = true
                view.button.addTarget(self, action: #selector(didTapDataButton(_:)), for: .touchUpInside)

                objc_setAssociatedObject(self, &kEmptyDataSetView, view, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
                
                return view
            }
        }
        set {
            objc_setAssociatedObject(self, &kEmptyDataSetView, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
    }
    
    internal var itemsCount: Int {
        var items = 0
        
        // UITableView support
        if let tableView = self as? UITableView {
            var sections = 1
            
            if let dataSource = tableView.dataSource {
                if dataSource.responds(to: #selector(UITableViewDataSource.numberOfSections(in:))) {
                    sections = dataSource.numberOfSections!(in: tableView)
                }
                if dataSource.responds(to: #selector(UITableViewDataSource.tableView(_:numberOfRowsInSection:))) {
                    for i in 0 ..< sections {
                        items += dataSource.tableView(tableView, numberOfRowsInSection: i)
                    }
                }
            }
        }
        
        return items
    }
        
    @objc private func didTapDataButton(_ sender: UIButton) {
        emptyDataSetView?.didTapDataButtonHandle?()
    }
    
    //MARK: - Reload APIs (Public)
    public func reloadEmptyDataSet() {
        guard configureEmptyDataSetView != nil else {
            return
        }
        
        if itemsCount == 0 {
            
            if let view = emptyDataSetView {
                
                if view.superview == nil {
                    // Send the view all the way to the back, in case a header and/or footer is present, as well as for sectionHeaders or any other content
                    if (self is UITableView) || (subviews.count > 1) {
                        insertSubview(view, at: 0)
                    } else {
                        addSubview(view)
                    }
                }
                
                // Removing view resetting the view and its constraints it very important to guarantee a good state
                // If a non-nil custom view is available, let's configure it instead
                view.prepareForReuse()
                
                
                // Configure the empty dataset view
                view.isHidden = false
                view.clipsToBounds = true
                
                // Configure scroll permission
                self.isScrollEnabled = false
                
                if let config = configureEmptyDataSetView {
                    config(view)
                }
                
                view.setupConstraints()
                view.layoutIfNeeded()
            }
            
            // Notifies that the empty dataset view did appear
        } else if isEmptyDataSetVisible {
            invalidate()
        }
    }
    
    private func invalidate() {
        if let view = emptyDataSetView {
            view.prepareForReuse()
            view.isHidden = true
        }
        self.isScrollEnabled = true
    }
    
    
    //MARK: - Method Swizzling
    @objc private func tableViewSwizzledReloadData() {
        tableViewSwizzledReloadData()
        reloadEmptyDataSet()
    }
    
    @objc private func tableViewSwizzledEndUpdates() {
        tableViewSwizzledEndUpdates()
        reloadEmptyDataSet()
    }
    
    @objc private func collectionViewSwizzledReloadData() {
        collectionViewSwizzledReloadData()
        reloadEmptyDataSet()
    }
    
    private class func swizzleMethod(for aClass: AnyClass, originalSelector: Selector, swizzledSelector: Selector) {
        let originalMethod = class_getInstanceMethod(aClass, originalSelector)
        let swizzledMethod = class_getInstanceMethod(aClass, swizzledSelector)
        
        let didAddMethod = class_addMethod(aClass, originalSelector, method_getImplementation(swizzledMethod!), method_getTypeEncoding(swizzledMethod!))
        
        if didAddMethod {
            class_replaceMethod(aClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod!)
        }
    }
    
    private static let swizzleReloadData: () = {
        let tableViewOriginalSelector = #selector(UITableView.reloadData)
        let tableViewSwizzledSelector = #selector(UIScrollView.tableViewSwizzledReloadData)
        
        swizzleMethod(for: UITableView.self, originalSelector: tableViewOriginalSelector, swizzledSelector: tableViewSwizzledSelector)
        
        let collectionViewOriginalSelector = #selector(UICollectionView.reloadData)
        let collectionViewSwizzledSelector = #selector(UIScrollView.collectionViewSwizzledReloadData)
        
        swizzleMethod(for: UICollectionView.self, originalSelector: collectionViewOriginalSelector, swizzledSelector: collectionViewSwizzledSelector)
    }()
    
    private static let swizzleEndUpdates: () = {
        let originalSelector = #selector(UITableView.endUpdates)
        let swizzledSelector = #selector(UIScrollView.tableViewSwizzledEndUpdates)
        
        swizzleMethod(for: UITableView.self, originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }()
}

