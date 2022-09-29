//
//  String+Version.swift
//  Bulletin
//
//  Created by Pranav Panchal on 28/09/22.
//  Copyright © 2022 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation


extension String {
    
    var isNumeric: Bool {
        guard self.count > 0 else { return false }
        let nums: Set<Character> = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
        return Set(self).isSubset(of: nums)
    }
    
    func validateVersion()  -> String?  {
        
        // Convert String In to Array
        let versionBlocks = self.components(separatedBy: ".")
        
        // Validation
        guard versionBlocks.isEmpty == false  else { return nil }
        
        // Validation For String as Int
        for versionBlock in versionBlocks  {
            if versionBlock.isNumeric == false {
                return nil
            }
        }
        
        return versionBlocks.joined(separator: ".")
    }
    
    func versionCompare(_ otherVersion: String) -> ComparisonResult {
        return self.compare(otherVersion, options: .numeric)
    }
}
