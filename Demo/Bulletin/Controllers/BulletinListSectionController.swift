//
//  BulletinListSectionController.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 19/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation
import IGListKit
import UIKit

internal protocol BulletinSectionControllerDelegate: AnyObject {
    func bulletinSectionController(_ sectionController: BulletinListSectionController, didClickItem item: BulletinItem)
}

class BulletinListSectionController: ListSectionController {
  
    // MARK: - Variable
    private var bulletinListSection: BulletinInfo?
    public weak var delegate: BulletinSectionControllerDelegate?
    
    private var bulletPointViewCell: BulletPointViewCell?
    private var actionButtonViewCell: ActionButtonViewCell?
    private var messageViewCell: MessageViewCell?
    private var mediaViewCell: MediaViewCell?
    private var titleViewCell: TitleViewCell?
    
    
    // MARK: - Initialisation Methods
    override init() {
        super.init()
        
        // Set Minimum Spacing
        minimumLineSpacing = 16
        inset = UIEdgeInsets(top: 16, left: 0, bottom:0, right: 0)
        
        
        // Init Sizing Cells
        bulletPointViewCell = Bundle.main.loadNibNamed("BulletPointViewCell", owner: self, options: nil)?.first as? BulletPointViewCell
        actionButtonViewCell = Bundle.main.loadNibNamed("ActionButtonViewCell", owner: self, options: nil)?.first as? ActionButtonViewCell
        messageViewCell = Bundle.main.loadNibNamed("MessageViewCell", owner: self, options: nil)?.first as? MessageViewCell
        mediaViewCell = Bundle.main.loadNibNamed("MediaViewCell", owner: self, options: nil)?.first as? MediaViewCell
        titleViewCell = Bundle.main.loadNibNamed("TitleViewCell", owner: self, options: nil)?.first as? TitleViewCell
    }
    
    
    // MARK: - IGListSectionController
    override func numberOfItems() -> Int {
        return bulletinListSection?.items.count ?? 0
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        
        // Validation
        guard let context = collectionContext,
              let item = bulletinListSection?.items[index] else { return .zero }
        
        switch item.type {
            
        case .title:
            
            // Set Cell Item
            titleViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: context.containerSize.width, height: CGFloat.greatestFiniteMagnitude)
            titleViewCell?.item = item as? Title
            
            // Calculate Height
            let height = max(titleViewCell?.intrinsicContentSize.height ?? 0 , 0)
            
            // Return Size
            return CGSize(width: context.containerSize.width, height: height)
            
        case .message:
            
            // Set Cell Item
            messageViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: context.containerSize.width - inset.left - inset.right, height: CGFloat.greatestFiniteMagnitude)
            messageViewCell?.item = item as? Message
            
            // Calculate Height
            let height = max(messageViewCell?.intrinsicContentSize.height ?? 0 , 0)
            
            // Return Size
            return CGSize(width: context.containerSize.width - inset.left - inset.right, height: height)
            
        case .media:
            
            // Set Announcement Info
            let cellWidth = context.containerSize.width - inset.left - inset.right
            mediaViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: cellWidth, height: CGFloat.greatestFiniteMagnitude)
            mediaViewCell?.item = item as? Media
            
            // Calculate Size
            let size = CGSize(width: cellWidth, height: mediaViewCell?.intrinsicContentSize.height ?? 0.0)
            
            return size
            
//            // Set Cell Item
//            mediaViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: context.containerSize.width, height: CGFloat.greatestFiniteMagnitude)
//            mediaViewCell?.item = item as? Media
//
//            // Calculate Height
//            let height = max(mediaViewCell?.intrinsicContentSize.height ?? 0 , 0)
            
            // Return Size
//            return CGSize(width: context.containerSize.width , height: height)
            
        case .bulletPoint:
            
            // Set Cell Item
            bulletPointViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: context.containerSize.width, height: CGFloat.greatestFiniteMagnitude)
            bulletPointViewCell?.item = item as? BulletPoint
            
            // Calculate Height
            let height = max(bulletPointViewCell?.intrinsicContentSize.height ?? 0 , 0)
            
            // Return Size
            return CGSize(width: context.containerSize.width, height: height)
            
        case .actionButton:
            
            // Set Cell Item
            actionButtonViewCell?.frame = CGRect(x: 0.0, y: 0.0, width: context.containerSize.width, height: CGFloat.greatestFiniteMagnitude)
            actionButtonViewCell?.item = item as? ActionButton
            
            // Calculate Height
            let height = max(actionButtonViewCell?.intrinsicContentSize.height ?? 0 , 0)
            
            // Return Size
            return CGSize(width: context.containerSize.width, height: height)
            
        case .undefined:
            return CGSize(width: 0, height: 0)
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        
        // Validation
        guard let items = bulletinListSection?.items else {
            fatalError()
        }
        
        let item = items[index]
        
        switch item.type {
            
        case .title:
            
            // Get Cell
            guard let cell = collectionContext?.dequeueReusableCell(withNibName: TitleViewCell.identifier(),
                                                                    bundle: nil, for: self, at: index) as? TitleViewCell else
            { fatalError() }
            
            // Item Validation
            if let item = item as? Title {

                // Set Item
                cell.item = item
            }
            
            // Set Delegate
            cell.delegate = self
            
            return cell
            
        case .message:
            
            // Get Cell
            // Get Cell
            guard let cell = collectionContext?.dequeueReusableCell(withNibName: MessageViewCell.identifier(),
                                                                    bundle: nil, for: self, at: index) as? MessageViewCell else
            { fatalError() }
            
            // Item Validation
            if let item = item as? Message {

                // Set Item
                cell.item = item
            }
            
            // Set Delegate
         //   cell.delegate = self
            
            return cell
            
        case .media:
            
            // Get Cell
            guard let cell = collectionContext?.dequeueReusableCell(withNibName: MediaViewCell.identifier(),
                                                                    bundle: nil, for: self, at: index) as? MediaViewCell else
            { fatalError() }
            
            // Item Validation
            if let item = item as? Media {

                // Set Item
                cell.item = item
            }
            
            // Set Delegate
            cell.delegate = self
            
            return cell
            
        case .bulletPoint:
            
            // Get Cell
            guard let cell = collectionContext?.dequeueReusableCell(withNibName: BulletPointViewCell.identifier(),
                                                                    bundle: nil, for: self, at: index) as? BulletPointViewCell else
            { fatalError() }
            
            // Item Validation
            if let item = item as? BulletPoint {

                // Set Item
                cell.item = item
            }
            
            // Set Delegate
            cell.delegate = self
            
            return cell
            
        case .actionButton:
            
            // Get Cell
            guard let cell = collectionContext?.dequeueReusableCell(withNibName: ActionButtonViewCell.identifier(),
                                                                    bundle: nil, for: self, at: index) as? ActionButtonViewCell else
            { fatalError() }
            
            // Item Validation
            if let item = item as? ActionButton {

                // Set Item
                cell.item = item
            }
            
            // Set Delegate
            cell.delegate = self
            
            return cell
            
        case .undefined:
            fatalError()
        }
    }
    
    override func didUpdate(to object: Any) {
        bulletinListSection = object as? BulletinInfo
    }
}



// MARK: - BulletListTitleCellDelegate
extension BulletinListSectionController: TitleViewCellDelegate {
   
    func titleViewCell(_ cell: TitleViewCell, ofItem item: BulletinItem) {
        
    }
    
}

// MARK: - BulletListTitleCellDelegate
extension BulletinListSectionController: MediaViewCellDelegate {
   
    func mediaViewCell(_ cell: MediaViewCell, ofItem item: BulletinItem) {
        
    }
    
}


// MARK: - BulletListTitleCellDelegate
extension BulletinListSectionController: MessageViewCellDelegate {
   
    func messageViewCell(_ cell: MessageViewCell, ofItem item: BulletinItem) {
        
    }
    
}

// MARK: - BulletListTitleCellDelegate
extension BulletinListSectionController: ActionButtonViewCellDelegate {
   
    func actionButtonViewCell(_ cell: ActionButtonViewCell, ofItem item: BulletinItem) {
        delegate?.bulletinSectionController(self, didClickItem: item)
    }
    
}

// MARK: - BulletListTitleCellDelegate
extension BulletinListSectionController: BulletPointViewCellDelegate {
   
    func bulletPointViewCell(_ cell: BulletPointViewCell, ofItem item: BulletinItem) {
        delegate?.bulletinSectionController(self, didClickItem: item)
    }
    
}

