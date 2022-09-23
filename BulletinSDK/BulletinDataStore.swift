//
//  BulletinDataStore.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import Foundation

typealias Version = String

class BulletinDataStore {
    
    
    // MARK: - Variable
    public private(set) var data = [Version: [BulletinItem]]()
    
    
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
        if items.isEmpty == false   {
            self.data[version] = items
        }
    }
    
    public func getData(fromVersion version: Version, limit: Int? = nil)  {
        
//        for appVersion in self.data    {
//            if appVersion.key == version  {
//                let bulletinItem = self.data[version]
//                for item in bulletinItem  {
//                    print("✅\(item.text)")
//                }
//            }
//        }
        
    }
    
}
