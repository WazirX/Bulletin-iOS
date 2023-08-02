//
//  UILabel+FontStyle.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 18/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit


extension UILabel {
    
    
    // MARK: - Heading 1 Methods
    public func heading1_regular() {
        font = AppStyle.Font.Regular(size: 48)
    }
    public func heading1_bold() {
        font = AppStyle.Font.Bold(size: 48)
    }
    public func heading1_semibold() {
        font = AppStyle.Font.SemiBold(size: 48)
    }
    
    
    // MARK: - Heading 2 Methods
    public func heading2_regular() {
        font = AppStyle.Font.Regular(size: 32)
    }
    public func heading2_bold() {
        font = AppStyle.Font.Bold(size: 32)
    }
    public func heading2_semibold() {
        font = AppStyle.Font.SemiBold(size: 32)
    }
    
    
    // MARK: - Heading 3 Methods
    public func heading3_regular() {
        font = AppStyle.Font.Regular(size: 25)
    }
    public func heading3_bold() {
        font = AppStyle.Font.Bold(size: 25)
    }
    public func heading3_semibold() {
        font = AppStyle.Font.SemiBold(size: 25)
    }
    
    
    // MARK: - Heading 4 Methods
    public func heading4_regular() {
        font = AppStyle.Font.Regular(size: 22)
    }
    public func heading4_bold() {
        font = AppStyle.Font.Bold(size: 22)
    }
    public func heading4_semibold() {
        font = AppStyle.Font.SemiBold(size: 22)
    }
    
    
    // MARK: - Heading 5 Methods
    public func heading5_regular() {
        font = AppStyle.Font.Regular(size: 20)
    }
    public func heading5_bold() {
        font = AppStyle.Font.Bold(size: 20)
    }
    public func heading5_semibold() {
        font = AppStyle.Font.SemiBold(size: 20)
    }
    
    
    // MARK: - Heading 6 Methods
    public func heading6_regular() {
        font = AppStyle.Font.Regular(size: 18)
    }
    public func heading6_bold() {
        font = AppStyle.Font.Bold(size: 18)
    }
    public func heading6_semibold() {
        font = AppStyle.Font.SemiBold(size: 18)
    }
    
    
    // MARK: - Large Methods
    public func large_regular() {
        font = AppStyle.Font.Regular(size: 16)
    }
    public func large_bold() {
        font = AppStyle.Font.Bold(size: 16)
    }
    public func large_semibold() {
        font = AppStyle.Font.SemiBold(size: 16)
    }
    public func large_medium() {
        font = AppStyle.Font.Medium(size: 16)
    }
    
    
    // MARK: - Base Methods
    public func base_regular() {
        font = AppStyle.Font.Regular(size: 14)
    }
    public func base_bold() {
        font = AppStyle.Font.Bold(size: 14)
    }
    public func base_semibold() {
        font = AppStyle.Font.SemiBold(size: 14)
    }
    public func base_medium() {
        font = AppStyle.Font.Medium(size: 14)
    }
    
    
    // MARK: - Small Methods
    public func small_regular() {
        font = AppStyle.Font.Regular(size: 12)
    }
    public func small_bold() {
        font = AppStyle.Font.Bold(size: 12)
    }
    public func small_semibold() {
        font = AppStyle.Font.SemiBold(size: 12)
    }
    public func small_medium() {
        font = AppStyle.Font.Medium(size: 12)
    }
    
    
    // MARK: - xSmall Methods
    public func xsmall_regular() {
        font = AppStyle.Font.Regular(size: 11)
    }
    public func xsmall_bold() {
        font = AppStyle.Font.Bold(size: 11)
    }
    public func xsmall_semibold() {
        font = AppStyle.Font.SemiBold(size: 11)
    }
    public func xsmall_medium() {
        font = AppStyle.Font.Medium(size: 11)
    }
}

