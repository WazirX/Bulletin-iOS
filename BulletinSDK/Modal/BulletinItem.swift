//
//  BulletinItem.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import Foundation

class BulletinItem  {
    
    
    // MARK: - Declarations
    public enum ItemType : String {
        case undefined
        case preTitle
        case title
        case message
        case media
        case bulletPoint
        case actionButton
    }
    
    
    // MARK: - Variables
    public var type: ItemType = .undefined

    

    // It Will Return Action Card Creatd With Proper Classes
    public class func createBulletinItem(forAttributes attributes: [String: Any]?) -> BulletinItem?    {
        
        // Validations
        guard let attributes = attributes,
              let typeString = attributes["type"] as? String,
              let itemType = ItemType(rawValue: typeString),
              itemType != .undefined  else  {
            return nil
        }
        
        // Get Bulletin Item
        if let bulletinItem = itemType.rawValue.capitalized.classFromString() as? BulletinItem.Type {
            return bulletinItem.init(attributes: attributes)
        }
        return nil
    }
    
    
    // MARK: - Initialisation Methods
    init() {}
    
    required public init?(attributes: [AnyHashable: Any]) {
        
        // Get Item Type (create guard here)
        if let itemTypeString = attributes["type"] as? String,
           let type = ItemType(rawValue: itemTypeString)
        {
            self.type = type
        }
        else {
            return nil
        }
    }
}
