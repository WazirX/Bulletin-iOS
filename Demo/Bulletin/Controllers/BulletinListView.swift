//
//  BulletinListView.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 19/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import IGListKit

class BulletinListView: UIView, BulletinSectionControllerDelegate {

    // MARK: - Variables
    @IBOutlet private var collectionView : UICollectionView!
    
    private var bulletinSection = BulletinSection() {
        didSet {
            // Update Collection View
            DispatchQueue.main.async { [weak self] in
                // Perform Updates
                self?.adapter.performUpdates(animated: true, completion: nil)
            }
        }
    }
    
    internal lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: nil, workingRangeSize: 0)
    }()

    
    // MARK: - Initialisation Methods
    public class func instance(bulletinSection: BulletinSection) -> BulletinListView {
        
        // Create Instance From XIB
        let className = String(describing: BulletinListView.self)
        let arrayOfViews = Bundle.main.loadNibNamed(className, owner: self, options: nil)
        if let view = arrayOfViews?.first as? BulletinListView  {
            
            // Set View Flexibility
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.translatesAutoresizingMaskIntoConstraints = true
            view.bulletinSection = bulletinSection
        
            return view
        }
        
        // Manually Create Instance
        let bulletinListView = BulletinListView()
        bulletinListView.bulletinSection = bulletinSection
        return bulletinListView
    }
    
    // MARK: - View Lifecycle Methods
    func loadVariables() {
      
        // Configure Adapter Properties
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.collectionViewDelegate = self
    }
    
    // MARK: - Initialisation Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    
        // Add Corner Curve
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        
        // Load Variables
        loadVariables()
        
    }
    
    // MARK: - Helper Method
    internal func performUpdates(animated: Bool, completion: ListUpdaterCompletion? = nil) {
        
        DispatchQueue.main.async { [weak self] in
            // Perform Updates
            self?.adapter.performUpdates(animated: animated, completion: completion)
        }
    }

}

// MARK: - ListAdapterDataSource
extension BulletinListView: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        var items = [ListDiffable]()
        items += [bulletinSection] as [ListDiffable]
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        let sectionController = BulletinListSectionController()
        sectionController.delegate = self
        return sectionController
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? { return nil }
}

// MARK: - UICollectionViewDelegate
extension BulletinListView: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}
