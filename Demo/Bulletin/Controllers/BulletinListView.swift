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
    @IBOutlet private var headerTitleLabel : UILabel!
    @IBOutlet private var headerView : UIStackView!
    @IBOutlet private var footerView : UIStackView!
    @IBOutlet private var gotItButton : UIButton!
    
    private var bulletinSection = [BulletinInfo]() {
        didSet {
            // Update Collection View
            DispatchQueue.main.async { [weak self] in
                // Perform Updates
                self?.adapter.performUpdates(animated: true, completion: nil)
            }
        }
    }
    
    internal var bulletinItems : [ListDiffable] {
        return bulletinSection
    }
    
    internal lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: nil, workingRangeSize: 0)
    }()

    
    // MARK: - Initialisation Methods
    public class func instance(items: [BulletinInfo]) -> BulletinListView {
        
        // Create Instance From XIB
        let className = String(describing: BulletinListView.self)
        let arrayOfViews = Bundle.main.loadNibNamed(className, owner: self, options: nil)
        if let view = arrayOfViews?.first as? BulletinListView  {
            
            // Set View Flexibility
            view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            view.translatesAutoresizingMaskIntoConstraints = true
            view.bulletinSection = items
        
            return view
        }
        
        // Manually Create Instance
        let bulletinListView = BulletinListView()
        bulletinListView.bulletinSection = items
        return bulletinListView
    }
    
    // MARK: - View Lifecycle Methods
    func loadVariables() {
      
        // Configure Adapter Properties
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.collectionViewDelegate = self
        
        gotItButton.layer.cornerRadius = AppStyle.ButtonCornerRadius
        
        // Set Insets
        collectionView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 64, right: 0)
        
        updateAppearance()
        
        updateContent()
    }
    
    func updateAppearance() {
        
        // Set Default Properties
        headerView.backgroundColor = AppStyle.Color.MainNavigationBg
        footerView.backgroundColor = AppStyle.Color.MainBgSurface_Alt
        gotItButton.backgroundColor = AppStyle.Color.BrandBgPrimary
        
        headerTitleLabel.textColor = AppStyle.Color.BrandTextOnPrimary
        headerTitleLabel.large_semibold()
        
        gotItButton.setTitleColor(AppStyle.Color.BrandTextOnPrimary, for: .normal)
        gotItButton.titleLabel?.base_semibold()
        
    }
    
    func updateContent() {
        
        // Set Default Proeprties
        headerTitleLabel.text = Text.WhatsNewInThisUpdate()
        gotItButton.setTitle(Text.GotIt().uppercased(), for: .normal)
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
        return bulletinItems
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
