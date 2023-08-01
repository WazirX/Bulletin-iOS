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
    @IBOutlet private weak var containerStackView: UIStackView!
    @IBOutlet private weak var mediaImageView: UIImageView!
    @IBOutlet private weak var imageViewHeightConstraint: NSLayoutConstraint!
    
    public weak var delegate: MediaViewCellDelegate?
    
    public var item: Media? {
        didSet {
            self.updateUI()
        }
    }
    
    override var intrinsicContentSize: CGSize   {
        let size = contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        return CGSize(width: UIView.noIntrinsicMetric, height: size.height)
    }
    
    
    // MARK: - Initialisation Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Setting Frame Of Inside Container SubView Of Cell
        if let item = item,
           let itemSize = item.size {
            let height : CGFloat = ((contentView.frame.width - containerStackView.layoutMargins.left - containerStackView.layoutMargins.right) * itemSize.height) / itemSize.width
            imageViewHeightConstraint.constant = height
        } else {
            imageViewHeightConstraint.constant = 135
        }
    }

    //MARK: - Helper Methods
    private func updateUI() {
        
        // Reset To Nil
        mediaImageView.kf.cancelDownloadTask()
        mediaImageView.image = nil
        
        // Validation
        guard let mediaItem = item else {
            return
        }
        
        // Set Image
        if let iconUrl = mediaItem.url {
            mediaImageView.kf.setImage(with: iconUrl) { [weak self] (result) in
                switch result {
                case .success(let value):
                    
                    // Image downloaded
                    if let weakSelf = self,
                       let sourceUrl = value.source.url,
                       sourceUrl == iconUrl {
                        weakSelf.mediaImageView.image = value.image
                        weakSelf.mediaImageView.isHidden = false
                    }
                case .failure(let error):
                    print("\(error.localizedDescription)")
                }
            }
        } else {
            mediaImageView.isHidden = true
        }
        
//        // Setting Frame Of Inside Container SubView Of Cell
//        if let itemSize = mediaItem.size {
//            let height : CGFloat = (frame.width * itemSize.height) / itemSize.width
//            imageViewHeightConstraint.constant = height
//        } else {
//            imageViewHeightConstraint.constant = 135
//        }
       
        // Layout Cell
        layoutIfNeeded()
    
    }
    
    override func updateAppearance() {
        super.updateAppearance()
        
        // Set Background Color
        backgroundColor = AppStyle.Color.MainBgSurface_Alt
    }
    
}
