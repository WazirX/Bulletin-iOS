//
//  MediaViewCell.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 20/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import Kingfisher

protocol MediaViewCellDelegate: AnyObject {
    func mediaViewCell(_ cell: MediaViewCell, ofItem item: BulletinItem)
}

class MediaViewCell: BaseCollectionViewCell {
    
    // MARK: - Variables
    @IBOutlet public var cardViewContainer: UIView!
    @IBOutlet private var artworkImageView: UIImageView!
    
    public weak var delegate: MediaViewCellDelegate?
    
    public var item: Media? {
        didSet {
            updateUI()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Setting Frame Of Inside Container SubView Of Cell
//        let size = subviewAspectSizeWithPadding(padding: 0, subviewWidth: item?.size?.width ?? 0.0, subviewHeight: 135.0)
//        cardViewContainer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        artworkImageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
//        
//        // Set Container View In Center Of Cell
//        cardViewContainer.center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        // Resize All InnerViews According To Content And Sent Width Height Of Cell
        cardViewContainer.autoresizesSubviews = true
        for _viewInner in cardViewContainer.subviews {
            
            _viewInner.autoresizesSubviews = true;
            _viewInner.autoresizingMask = [.flexibleWidth, .flexibleHeight, .flexibleLeftMargin, .flexibleRightMargin, .flexibleTopMargin, .flexibleBottomMargin]
        }
    }

    private func updateUI() {
        
        // Validation
        guard let mediaItem = item else {
           
            // Reset To Nil
            artworkImageView.image = nil
            return
        }
        
        // Set downloaded Image Icon
        if let iconUrl = mediaItem.url {
            artworkImageView.kf.setImage(with: iconUrl) { [weak self] (result) in
                switch result {
                case .success(let value):
                    
                    // Image downloaded
                    if let sourceUrl = value.source.url,
                       sourceUrl == iconUrl {
                        self?.artworkImageView.image = value.image
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        }
        
        // Setting Frame Of Inside Container SubView Of Cell
        let size = subviewAspectSizeWithPadding(padding: 0, subviewWidth: item?.size?.width ?? 0.0, subviewHeight: item?.size?.height ?? 0.0)
        cardViewContainer.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        artworkImageView.frame = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        // Set Container View In Center Of Cell
        cardViewContainer.center = CGPoint(x: bounds.size.width / 2.0, y: bounds.size.height / 2.0)
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set Background Color
        backgroundColor = AppStyle.Color.SuccessTextPrimary
        cardViewContainer.backgroundColor = AppStyle.Color.DangerTextPrimary
    }
    
}
