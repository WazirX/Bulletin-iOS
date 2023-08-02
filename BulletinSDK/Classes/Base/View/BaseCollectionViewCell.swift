//
//  BaseTableViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 17/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Constants
    public class func identifier() -> String {
        return String(describing: self)
    }
    
    
    // MARK: - Initialisation Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if #available(iOS 13.0, *) {
            layer.cornerCurve = .continuous
        }
        
        // Load Variables
        loadVariables()
        
        // Update Appearance
        updateAppearance()
        
    }
    
    
    // MARK: - Override Methods
    open func loadVariables()  {
        // Override This Method In Subclass To Initialize Variables
    }
    
    open func updateAppearance()  {
        // Override This Method In Subclass To Set/Update Appearance
    }
    
}
