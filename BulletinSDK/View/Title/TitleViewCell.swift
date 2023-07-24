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
    @IBOutlet private var actionContainerStackView: UIStackView!
    @IBOutlet private var preTitle: UILabel!
    @IBOutlet private var Title: UILabel!
    @IBOutlet private var subTitle: UILabel!
    
    public weak var delegate: TitleViewCellDelegate?
    
    
    public var item: Title? {
        didSet {
            
            // Validation
            guard let titleItem = item else {
                
                // Reset To Nil
                preTitle.text = nil
                Title.text = nil
                subTitle.text = nil
                
                return
            }
            
            // Set Version Number
            preTitle.text = titleItem.preTitleText
            
            // Set Version Title
            Title.text = titleItem.titleText
            
            // Set Version SubTitle
            subTitle.text = titleItem.subTitleText
            
        }
    }

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
        backgroundColor = AppStyle.Color.Background
       
    
        // Set preTitle Label
        preTitle.small_medium()
        preTitle.textColor = AppStyle.Color.SuccessTextPrimary
        
        // Set Title Label
        Title.heading4_semibold()
        Title.textColor = AppStyle.Color.MainTextPrimary
        
        // Set subTitle Label
        subTitle.base_regular()
        subTitle.textColor = AppStyle.Color.MainTextPrimary
        
    }
    
}

