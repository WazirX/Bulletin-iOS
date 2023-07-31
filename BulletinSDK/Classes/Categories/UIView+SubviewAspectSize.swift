//
//  UIView+SubviewAspectSize.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 26/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

extension UIView {
    
    // Get Subview Aspect Size
    func subviewAspectSizeWithPadding(padding: CGFloat, subviewWidth: CGFloat, subviewHeight: CGFloat) -> CGSize {
        let viewWidth = frame.size.width - padding
        let viewHeight = ((frame.size.width - padding) / frame.size.width) * frame.size.height
        
        var newSubviewWidth: CGFloat = 0
        var newSubviewHeight: CGFloat = 0
        
        if viewWidth < viewHeight {
            // View Height Is Large
            newSubviewWidth = viewWidth
            newSubviewHeight = getNewSubviewHeight(using: newSubviewWidth, subviewWidth: subviewWidth, subviewHeight: subviewHeight)
            
            if newSubviewHeight > viewHeight {
                newSubviewHeight = viewHeight
                newSubviewWidth = getNewSubviewWidth(using: newSubviewHeight, subviewWidth: subviewWidth, subviewHeight: subviewHeight)
            }
        }
        else {
            // View Width Is Large
            newSubviewHeight = viewHeight
            newSubviewWidth = getNewSubviewWidth(using: newSubviewHeight, subviewWidth: subviewWidth, subviewHeight: subviewHeight)
            
            if newSubviewWidth > viewWidth {
                newSubviewWidth = viewWidth
                newSubviewHeight = getNewSubviewHeight(using: newSubviewWidth, subviewWidth: subviewWidth, subviewHeight: subviewHeight)
            }
        }
        
        return CGSize(width: newSubviewWidth, height: newSubviewHeight)
    }
    
    // Get Subview Aspect Height
    func getAspectHeightForSubView(subviewWidth: CGFloat, subviewHeight: CGFloat) -> CGFloat {
        let viewWidth = frame.size.width
        let viewHeight = frame.size.height
        
        var newSubviewWidth: CGFloat = viewWidth
        var newSubviewHeight: CGFloat = getNewSubviewHeight(using: newSubviewWidth, subviewWidth: subviewWidth, subviewHeight: subviewHeight)
        
        return newSubviewHeight
    }
    
    // Get New Subview Proportional Width
    func getNewSubviewWidth(using newSubviewHeight: CGFloat, subviewWidth: CGFloat, subviewHeight: CGFloat) -> CGFloat {
        return (newSubviewHeight * subviewWidth) / subviewHeight
    }
    
    // Get New Subview Proportional Height
    func getNewSubviewHeight(using newSubviewWidth: CGFloat, subviewWidth: CGFloat, subviewHeight: CGFloat) -> CGFloat {
        return (newSubviewWidth * subviewHeight) / subviewWidth
    }
}

