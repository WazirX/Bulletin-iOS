//
//  BulletPoint.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit

class BulletPoint: BulletinItem {

    
    // MARK: Variables
    var bullet: Bullet?
    var titleText: String?
    var subTitleText: String?
    
    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .bulletPoint
    }
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set Bullet
        guard let bulletObj = attributes["bullet"] as? [String: Any],
           let bullet = Bullet(attributes: bulletObj) else {
            return nil
        }
        self.bullet = bullet
        
        // Set Title Text
        self.titleText = attributes["titleText"] as? String
        
        // Set SubTitle Text
        self.subTitleText = attributes["subTitleText"] as? String
        
        // Validation
        if titleText == nil && subTitleText == nil  {
            return nil
        }
    }
}



// MARK: - Bullet
class Bullet {

    
    // MARK: - Enum
    enum BulletType: String  {
        case unicode
        case image
    }
    
    
    // MARK: - Variables
    var bulletType: BulletType?
    var unicode: String?
    var imageUrl: URL?
    
    
    // MARK: - Initialisation Methods
    init() {}
    
    init?(attributes: [String: Any]?) {
        
        
        // Validation
        guard let attributes = attributes else {
            return nil
        }
        
        // Set Type
        guard let bulletTypeString = attributes["bulletType"] as? String,
              let bulletType = BulletType(rawValue: bulletTypeString) else {
            return nil
        }
        self.bulletType = bulletType
        
        switch self.bulletType {
        case .unicode:
            // Set Unicode
            guard let unicodeString = attributes["unicode"] as? String  else {
                return nil
            }
            self.unicode = unicodeString
            
        case .image:
            // Set ImageUrl
            guard let imageUrlString = attributes["imageUrl"] as? String,
                  let imageUrl = URL(string: imageUrlString)  else {
                return nil
            }
            self.imageUrl = imageUrl
            
        case .none:
            break
        }
    }
}

