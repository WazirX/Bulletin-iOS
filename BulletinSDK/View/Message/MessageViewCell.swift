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
    @IBOutlet private var descMsgLabel: UILabel!
    
    public weak var delegate: MessageViewCellDelegate?
    
    public var item: Message? {
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

        // Set Description Label
        descMsgLabel.base_regular()
        descMsgLabel.textColor = AppStyle.Color.MainTextPrimary

    }
    
    //MARK: - Helper Methods
    private func updateUI() {
        
        // Validation
        guard let messageItem = item else {
            
            // Reset To Nil
            descMsgLabel.text = nil
            
            return
        }
        
        switch (messageItem.messageType) {
            
        case .html:
            
            // Set Html Description Message
            if let descMessage = messageItem.text,
               descMessage.isEmpty == false,
             let htmlAttributedString = descMessage.html2AttributedString(usingFont: AppStyle.Font.Medium(size: 12), color: AppStyle.Color.MainTextPrimary)?.trailingNewlineChopped
            {
                descMsgLabel.attributedText = htmlAttributedString
                descMsgLabel.isHidden = false
            } else {
                descMsgLabel.isHidden = true
            }
            
        case .text:
            
            // Set Description Message
            if let descMessage = messageItem.text,descMessage.isEmpty == false {
                descMsgLabel.text = descMessage
                descMsgLabel.isHidden = false
            } else {
                descMsgLabel.isHidden = true
            }

        }
        
        // Layout Cell
        setNeedsLayout()
        layoutIfNeeded()
    }
    
}
