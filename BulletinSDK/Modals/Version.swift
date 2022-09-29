//
//  Version.swift
//  Bulletin
//
//  Created by Pranav Panchal on 28/09/22.
//  Copyright © 2022 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation


struct Version   {
    
    
    // MARK: - Variable
    public let version: String
    
    
    // MARK: - Initialisation Method
    init?(_ version: String) {
        
        // Validation
        guard let version = version.validateVersion()  else { return nil }
        
        // Set Version
        self.version = version
    }
    
}

extension Version: Equatable {
    static func == (lhs: Version, rhs: Version) -> Bool {
        return lhs.version == rhs.version
    }
}

extension Version: Comparable {
    static func < (lhs: Version, rhs: Version) -> Bool {
        if lhs.version.versionCompare(rhs.version) == .orderedAscending {
            return true
        }
        return false
    }
    
    static func <= (lhs: Version, rhs: Version) -> Bool {
        let result = lhs.version.versionCompare(rhs.version)
        if result == .orderedAscending || result == .orderedSame {
            return true
        }
        return false
    }
    
    static func > (lhs: Version, rhs: Version) -> Bool {
        if lhs.version.versionCompare(rhs.version) == .orderedDescending {
            return true
        }
        return false
    }
    
    static func >= (lhs: Version, rhs: Version) -> Bool {
        let result = lhs.version.versionCompare(rhs.version)
        if result == .orderedDescending || result == .orderedSame {
            return true
        }
        return false
    }
}
