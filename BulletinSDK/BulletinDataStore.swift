//
//  BulletinDataStore.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import Foundation

class BulletinDataStore {
    
    
    // MARK: - Variable
    public private(set) var data = [BulletinInfo]()
    
    
    // MARK: - Initialisation Methods
    public init() {}
    
    public init?(attributes: [String : Any]) {
        
    }
    
    
    // MARK: - Helper Methods
    public func registerVersionInfo(version: Version, items: [[String: Any]]) {
        
        var bulletinItems = [BulletinItem]()
        for itemAttributes in items  {
            guard let bulletinItem = BulletinItem.createBulletinItem(forAttributes: itemAttributes) else { continue }
            bulletinItems.append(bulletinItem)
        }
        
        registerVersionInfo(version: version, items: bulletinItems)
    }
    
    public func registerVersionInfo(version: Version, items: [BulletinItem])   {
        
        // Validation
        guard items.isEmpty == false else { return }
        
        // Create Bulletin Info Object
        let bulletinInfo = BulletinInfo(version: version, items: items)
        
        for (i,item) in data.enumerated()    {
            
            // Check If Same Version Available In Data
            if item.version == version  {
                
                // Remove Value
                data.remove(at: i)
                
                // Add New Value
                data.append(bulletinInfo)
                return
            }
        }
        
        data.append(bulletinInfo)
    }
    
    public func getData(fromNewVersion newVersion: Version?, toOldVersion oldVersion: Version?, limit: Int? = nil) -> [BulletinInfo]? {
        
        // Sort Bulletin Info
        let sorttedItems = data.sorted(by: { $0.version > $1.version })
        
        // Validation For Limit
        guard let limit = limit else {
            return sorttedItems
        }
        
        return nil
    }
    
}
