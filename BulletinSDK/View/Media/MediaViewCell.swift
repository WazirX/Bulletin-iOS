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
            
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
}
