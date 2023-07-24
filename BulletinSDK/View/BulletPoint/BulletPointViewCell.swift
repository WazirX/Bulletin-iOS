//
//  BulletPointViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 20/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

protocol BulletPointViewCellDelegate: AnyObject {
    func bulletPointViewCell(_ cell: BulletPointViewCell, ofItem item: BulletinItem)
}

class BulletPointViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    @IBOutlet private var bulletTitle: UILabel!
    @IBOutlet private var bulletDesc: UILabel!
    @IBOutlet private var bulletName: UILabel!
    @IBOutlet private var bulletImageView: UIImageView!
    
    public weak var delegate: BulletPointViewCellDelegate?
    
    public var item: BulletPoint? {
        didSet {
            
            // Validation
            guard let bulletPointItem = item else {
                
                // Reset To Nil
                bulletTitle = nil
                bulletDesc = nil
                bulletImageView = nil
                bulletName = nil
                
                return
            }
            
            switch (bulletPointItem.bullet?.bulletType) {
                
            case .unicode:
                
                let htmlAttributedString = bulletPointItem.bullet?.unicode?.html2AttributedString(usingFont: AppStyle.Font.SemiBold(size: 14.0), color: AppStyle.Color.SecondaryText)?.trailingNewlineChopped
                
                if let attributedMessage = htmlAttributedString {
                    
                    // Set Description Message
                    bulletTitle.attributedText = attributedMessage
                }
                
            case .image:
               
                // Set downloaded Image Icon
                if let iconUrl = bulletPointItem.bullet?.imageUrl {
                    bulletImageView.kf.setImage(with: iconUrl) { [weak self] (result) in
                        switch result {
                        case .success(let value):
                            
                            // Image downloaded
                            if let sourceUrl = value.source.url,
                               sourceUrl == iconUrl {
                                self?.bulletImageView.image = value.image
                            }
                        case .failure(let error):
                            print("\(error.localizedDescription)")
                        }
                    }
                }
                
            case .none:
                bulletTitle.isHidden = true
                bulletDesc.isHidden = true
            }
            
            bulletTitle.text = bulletPointItem.titleText
            bulletDesc.text = bulletPointItem.subTitleText
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set Background Color
        backgroundColor = AppStyle.Color.Background
       
    
        // Set preTitle Label
        bulletTitle.small_medium()
        bulletTitle.textColor = AppStyle.Color.SuccessTextPrimary
        
        // Set Title Label
        bulletDesc.heading4_semibold()
        bulletDesc.textColor = AppStyle.Color.MainTextPrimary
        
        bulletName.heading4_semibold()
    }
    
}

