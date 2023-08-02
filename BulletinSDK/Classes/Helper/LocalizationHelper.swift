//
//  LocalizationHelper.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 18/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import Foundation


class LocalizationHelper  {
    
    public class func string(forKey key: String) -> String {
        return string(forKey: key, replaceOccurencesOfKeysWithValues: nil)
    }
    
    public class func string(forKey key: String,
                             replaceOccurencesOfKeysWithValues keyValuePairs: [String:String]?) -> String
    {
        var localizedString = NSLocalizedString(key, tableName: "Localizable", bundle: Bundle.main, value: "", comment: "")
        if localizedString == key {
            localizedString = NSLocalizedString(key, comment: "")
        }
        
        if let keyValuePairs = keyValuePairs, keyValuePairs.isEmpty == false {
            for key in keyValuePairs.keys {
                let keyToReplace = "~{" + key + "}"
                if let replaceWithValue = keyValuePairs[key] {
                    localizedString = localizedString.replacingOccurrences(of: keyToReplace, with: replaceWithValue)
                }
            }
        }
        
        return localizedString
    }
}


extension String  {
    
    // Localization Conveniance method for strings
    public func localized() -> String {
        return LocalizationHelper.string(forKey: self)
    }
    
    public func localized(replaceOccurencesOfKeysWithValues keyValuePairs: [String: String]?) -> String {
        return LocalizationHelper.string(forKey: self, replaceOccurencesOfKeysWithValues: keyValuePairs)
    }
}


