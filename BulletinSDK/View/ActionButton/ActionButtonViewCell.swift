//
//  ActionButtonViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 20/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

protocol ActionButtonViewCellDelegate: AnyObject {
    func actionButtonViewCell(_ cell: ActionButtonViewCell, ofItem item: BulletinItem)
}

class ActionButtonViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    @IBOutlet private var actionButton: PushButton!
    
    
    public weak var delegate: ActionButtonViewCellDelegate?
    
    public var item: ActionButton? {
        didSet {
            
            // Validation
            guard let actionButtonItem = item else {
                
                // Reset To Nil
                actionButton = nil
                
                return
            }
            
            
            // Open Gift Button
            if let actionButtonTitle = actionButtonItem.title {
                actionButton.setTitle(actionButtonTitle.uppercased(), for: .normal)
            }
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Action Button
        actionButton.layer.cornerRadius = AppStyle.ButtonCornerRadius
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set BackgroundColor
        backgroundColor = AppStyle.Color.Background
        
        // Set Action Button Container View
        actionButton.setTitleColor(AppStyle.Color.BrandTextPrimary, for: .normal)
        actionButton.titleLabel?.base_semibold()
        actionButton.layer.borderWidth = 1.0
        actionButton.layer.borderColor = AppStyle.Color.BrandBgPrimary.cgColor
      
    }
    
    @IBAction func updateProfileButtonTapped(_ sender: Any) {
        
        // Validation
        guard let item = item else { return }

        // Call Delegate
        delegate?.actionButtonViewCell(self, ofItem: item)
    }
}

