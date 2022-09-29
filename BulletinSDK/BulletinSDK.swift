//
//  BulletinSDK.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import Foundation

class BulletinSDK   {
    
    
    // MARK: - Variables
    public let dataStore: BulletinDataStore
    
    
    // MARK: Initialisation Method
    public init(dataStore: BulletinDataStore) {
        
        // Set Data Store
        self.dataStore = dataStore
    }
    
    
    // MARK: - Helper Methods
    public func showFullBulletin() -> Bool {
        
        // Get Bulletin Items
        let items = dataStore.getData(fromNewVersion: nil, toOldVersion: nil)
        
        // Show Bulletin
        return showBulletin(items: items)
    }
    
    public func showLastBulletins(limit: Int = 1) -> Bool {
        
        // Get Bulletin Items
        let items = dataStore.getData(fromNewVersion: nil, toOldVersion: nil, limit: limit)
        
        // Show Bulletin
        return showBulletin(items: items)
    }
    
    public func showUnseenBulletins(limit: Int? = nil) -> Bool {
        
        // Get Last Seen Version
        guard let lastSeenVersion = UserDefaults.lastSeenVersion else { return false }
        
        // Get Bulletin Items
        let items = dataStore.getData(fromNewVersion: lastSeenVersion, toOldVersion: nil, limit: limit)
        
        // Show Bulletin
        return showBulletin(items: items)
    }
    
    private func showBulletin(items: [BulletinInfo]?) -> Bool {
        
        // Validation
        guard let items = items,
              items.isEmpty == false else { return false }
        
        return false
    }
}
