//
//  String+Unicode.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 26/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation

extension String {
    
    var unicodeString: String? {
        if let charCode = UInt32(self, radix: 16),
           let unicode = UnicodeScalar(charCode) {
            let str = String(unicode)
            return str
        }
        return nil
    }
}
