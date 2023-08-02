//
//  BulletinListVC.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 31/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import IGListKit

internal protocol BulletinListDelegate: AnyObject {
    func BulletinList(didClickItem item: BulletinItem)
}

class BulletinListVC: UIViewController {

    // MARK: - Variables
    @IBOutlet private var collectionView : UICollectionView!
    @IBOutlet private var headerTitleLabel : UILabel!
    @IBOutlet private var headerView : UIView!
    @IBOutlet private var footerView : UIStackView!
    @IBOutlet private var gotItButton : UIButton!
    @IBOutlet private weak var collectionViewHeightConstraint: NSLayoutConstraint?
    
    public weak var delegate: BulletinListDelegate?
    
    private var bulletinSection = [BulletinInfo]()

    
    internal var bulletinItems : [ListDiffable] {
        return bulletinSection
    }
    
    internal lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: nil, workingRangeSize: 0)
    }()

    
    // MARK: - Initialisation Methods
    public class func instance(items: [BulletinInfo]) -> BulletinListVC {
        
        // Create Bulletin VC
        let bulletinVC = BulletinListVC()
        bulletinVC.bulletinSection = items
        return bulletinVC
    }
    
    // MARK: - View Lifecycle Methods
    func loadVariables() {
      
        // Configure Adapter Properties
        adapter.collectionView = collectionView
        adapter.dataSource = self
        adapter.collectionViewDelegate = self
        
        gotItButton.layer.cornerRadius = AppStyle.ButtonCornerRadius
        
        // Set Insets
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
        
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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // Load Variables
        loadVariables()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.collectionViewLayout.invalidateLayout()
    }
    
    
    // MARK: - Helper Method
    public func reload(animated: Bool, completion: ListUpdaterCompletion? = nil) {
        
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else { return }
            
            // Perform Updates
            weakSelf.adapter.performUpdates(animated: animated, completion: {(finished) in
                
                // ReLayout to Forces View And Its Subviews to update immediately
                weakSelf.view.layoutIfNeeded()
                var superViewHeight: CGFloat = 480
                let minTopMargin: CGFloat = 50
                var collectionViewHeight = weakSelf.collectionView.contentSize.height
                let extraViewHeight: CGFloat = weakSelf.headerView.frame.height + weakSelf.footerView.frame.height
                if let window = UIApplication.shared.keyWindow {
                    superViewHeight = window.frame.size.height - window.safeAreaInsets.top - window.safeAreaInsets.bottom
                }
                if collectionViewHeight > (superViewHeight - minTopMargin - extraViewHeight) {
                    collectionViewHeight = superViewHeight - minTopMargin - extraViewHeight
                    weakSelf.collectionView.isScrollEnabled = true
                } else {
                    weakSelf.collectionView.isScrollEnabled = false
                }
                
                let contentHeight = min(collectionViewHeight, superViewHeight)
                weakSelf.collectionViewHeightConstraint?.constant = contentHeight
                weakSelf.view.setNeedsLayout()
                weakSelf.preferredContentSize = CGSize(width: weakSelf.preferredContentSize.width, height: superViewHeight - 40)
                completion?(finished)
            })
        }
    }
    
}

// MARK: - ListAdapterDataSource
extension BulletinListVC: ListAdapterDataSource {
    
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
extension BulletinListVC: UICollectionViewDelegate {
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {}
}

// MARK: - BulletinSectionControllerDelegate
extension BulletinListVC: BulletinSectionControllerDelegate {
    func bulletinSectionController(_ sectionController: BulletinListSectionController, didClickItem item: BulletinItem) {
        
        // Clicked Item
        delegate?.BulletinList(didClickItem: item)
    }
    
}
