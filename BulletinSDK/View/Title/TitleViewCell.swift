//
//  TitleViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 20/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

protocol TitleViewCellDelegate: AnyObject {
    func titleViewCell(_ cell: TitleViewCell, ofItem item: BulletinItem)
}

class TitleViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    @IBOutlet private var preTitleLabel: UILabel!
    @IBOutlet private var titleLabel: UILabel!
    @IBOutlet private var subTitleLabel: UILabel!
    
    public weak var delegate: TitleViewCellDelegate?
    
    public var item: Title? {
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
    
    override func loadVariables() {
        super.loadVariables()
        
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set Background Color
        backgroundColor = AppStyle.Color.MainBgSurface_Alt
    
        // Set preTitle Label
        preTitleLabel.small_medium()
        preTitleLabel.textColor = AppStyle.Color.SuccessTextPrimary
        
        // Set Title Label
        titleLabel.heading4_semibold()
        titleLabel.textColor = AppStyle.Color.MainTextPrimary
        
        // Set subTitle Label
        subTitleLabel.base_regular()
        subTitleLabel.textColor = AppStyle.Color.MainTextPrimary
        
    }
    
    //MARK: - Helper Methods
    private func updateUI() {
        
        // Validation
        guard let titleItem = item else {
            
            // Reset To Nil
            preTitleLabel.text = nil
            titleLabel.text = nil
            subTitleLabel.text = nil
            return
        }
        
        // Set Version Number
        if let preTitle = titleItem.preTitleText,preTitle.isEmpty == false {
            preTitleLabel.text = preTitle
            preTitleLabel.isHidden = false
        } else {
            preTitleLabel.isHidden = true
        }
        
        // Set Version Title
        if let title = titleItem.titleText,title.isEmpty == false {
            titleLabel.text = title
            titleLabel.isHidden = false
        } else {
            titleLabel.isHidden = true
        }
        
        // Set Version SubTitle
        if let subTitle = titleItem.subTitleText,subTitle.isEmpty == false {
            subTitleLabel.text = subTitle
            subTitleLabel.isHidden = false
        } else {
            subTitleLabel.isHidden = true
        }

        // Layout Cell
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}

