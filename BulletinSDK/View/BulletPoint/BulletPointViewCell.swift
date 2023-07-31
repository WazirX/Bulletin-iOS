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
           updateUI()
        }
    }
    
    override var intrinsicContentSize: CGSize {
        let size = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: UIView.noIntrinsicMetric, height: size.height)
    }

    // MARK: - Initialisation Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set Background Color
        backgroundColor = AppStyle.Color.MainBgSurface_Alt
       
    
        // Set preTitle Label
        bulletTitle.large_semibold()
        bulletTitle.textColor = AppStyle.Color.MainTextPrimary
        
        // Set Title Label
        bulletDesc.base_regular()
        bulletDesc.textColor = AppStyle.Color.MainTextSecondary
        
      //  bulletName.heading4_semibold()
    }
    
    //MARK: - Helper Methods
    private func updateUI() {
        
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
            
            // Set Unicode Icon
            if let bulletUnicode = bulletPointItem.bullet?.unicode?.unicodeString {
                bulletName.text = bulletUnicode
            }
            
        case .image:
           
            // Set Image Icon
            if let iconUrl = bulletPointItem.bullet?.imageUrl {
                bulletImageView.kf.setImage(with: iconUrl) { [weak self] (result) in
                    switch result {
                    case .success(let value):
                        
                        // Image downloaded
                        if let sourceUrl = value.source.url,
                           sourceUrl == iconUrl {
                            self?.bulletImageView.isHidden = true
                            self?.bulletImageView.image = value.image
                        }
                    case .failure(let error):
                        print("\(error.localizedDescription)")
                    }
                }
            } else {
                bulletImageView.image = nil
                bulletImageView.isHidden = true
            }
            
        case .none:
            bulletImageView.isHidden = true
            bulletName.isHidden = true
        }
        
        // Set Bullet Title
        if let title = bulletPointItem.titleText,title.isEmpty == false {
            bulletTitle.isHidden = false
            bulletTitle.text = title
        } else {
            bulletTitle.isHidden = true
        }
        
        // Set Bullet Desc
        if let subTitle = bulletPointItem.subTitleText {
            bulletDesc.isHidden = false
            bulletDesc.text = subTitle
        } else {
            bulletDesc.isHidden = true
        }
        
        // Layout Cell
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}

