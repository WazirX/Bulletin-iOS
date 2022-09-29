//
//  UserDefaults+Storage.swift
//  Bulletin
//
//  Created by Pranav Panchal on 23/09/22.
//  Copyright © 2022 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation


extension UserDefaults  {
    
    class var bulletin: UserDefaults  {
        get {
            return UserDefaults(suiteName: "Bulletin")!
        }
        set {}
    }
    
    class var lastSeenVersion: Version? {
        get {
            
            // Validation
            guard let versionString = bulletin.string(forKey: "BLLastSeenVersion") else { return nil }
            
            return Version(versionString)
        }
        set {
            if let newValue = newValue {
                bulletin.set(newValue.version, forKey: "BLLastSeenVersion")
            } else {
                bulletin.removeObject(forKey: "BLLastSeenVersion")
            }
        }
    }
}
