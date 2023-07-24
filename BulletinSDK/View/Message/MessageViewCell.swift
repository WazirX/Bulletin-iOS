//
//  MessageViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 20/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

protocol MessageViewCellDelegate: AnyObject {
    func messageViewCell(_ cell: MessageViewCell, ofItem item: BulletinItem)
}

class MessageViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    @IBOutlet private var descTitle: UILabel!
    
    public weak var delegate: MessageViewCellDelegate?
    
    public var item: Message? {
        didSet {
            
            // Validation
            guard let messageItem = item else {
                
                // Reset To Nil
                descTitle.text = nil
                
                return
            }
            
            switch (messageItem.messageType) {
                
            case .html:
                
                let htmlAttributedString = messageItem.text?.html2AttributedString(usingFont: AppStyle.Font.SemiBold(size: 14.0), color: AppStyle.Color.SecondaryText)?.trailingNewlineChopped
                
                if let attributedMessage = htmlAttributedString {
                    
                    // Set Description Message
                    descTitle.attributedText = attributedMessage
                }
                
            case .text:
               
                // Set Description Message
                descTitle.text = messageItem.text
            }
            
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
       
        // Set Description Label
        descTitle.base_regular()
        descTitle.textColor = AppStyle.Color.MainTextPrimary
        
    }
    
}
