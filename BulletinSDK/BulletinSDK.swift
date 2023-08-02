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
    public init(dataStore: BulletinDataStore, appearance: Appearance) {
        
        // Set Data Store
        self.dataStore = dataStore
        applyAppearance(theme: appearance)
    }
    
    
    // MARK: - Helper Methods
    public func getFullBulletin() -> BulletinListVC? {
        
        // Get   Bulletin Items
        let items = dataStore.getData(fromNewVersion: nil, toOldVersion: nil)
        
        // Show Bulletin
        return getBulletin(items: items)
    }
    
    public func getLastBulletins(limit: Int = 1) -> BulletinListVC? {
        
        // Get Bulletin Items
        let items = dataStore.getData(fromNewVersion: nil, toOldVersion: nil, limit: limit)
        
        // Show Bulletin
        return getBulletin(items: items)
    }
    
    public func getUnseenBulletins(limit: Int? = nil) -> BulletinListVC? {
        
        // Get Last Seen Version
        guard let lastSeenVersion = UserDefaults.lastSeenVersion else { return nil }
        
        // Get Bulletin Items
        let items = dataStore.getData(fromNewVersion: lastSeenVersion, toOldVersion: nil, limit: limit)
        
        // Show Bulletin
        return getBulletin(items: items)
    }
    
    private func getBulletin(items: [BulletinInfo]?) -> BulletinListVC? {
        
        // Validation
        guard let items = items,
              items.isEmpty == false else { return nil }
        
        let bulletinListVC = BulletinListVC.instance(items: items)
        
        return bulletinListVC
    }
    
    private func applyAppearance(theme: Appearance)  {
        
        // Apply Theme
        switch theme {
            case .darkKnight:
           
            // Apply Dark Knight Theme
            Appearance.darkKnight.apply(shouldBroadcastUpdate: true)
            
            case .whiteKnight:
            
            // Apply Dark Knight Theme
            Appearance.whiteKnight.apply(shouldBroadcastUpdate: true)
        }
        
    }
}
