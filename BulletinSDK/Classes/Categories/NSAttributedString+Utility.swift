//
//  NSAttributedString+Utility.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 21/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation

extension NSAttributedString {
    
    var trailingNewlineChopped: NSAttributedString {
        if string.hasSuffix("\n") {
            return attributedSubstring(from: NSRange(location: 0, length: length - 1))
        } else {
            return self
        }
    }
}
