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
    func showFullBulletin() {
        
    }
    
    func showBulletinFromLastVersion(limit: Int? = nil) {

    }
    
    func showBulletin(fromVersion version: String, limit: Int? = nil)   {
        dataStore.getData(fromVersion: version)
    }
}
