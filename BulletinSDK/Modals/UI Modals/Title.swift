//
//  Title.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit

class Title: BulletinItem {
    
    
    // MARK: - Variable
    var preTitleText: String?
    var titleText: String?
    var subTitleText: String?

    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .title
    }
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set Pre Title
        preTitleText = attributes["preTitleText"] as? String
        
        // Set Title
        titleText = attributes["titleText"] as? String
        
        // Set Sub Title
        subTitleText = attributes["subTitleText"] as? String
        
        // Validations
        if preTitleText == nil && titleText == nil && subTitleText == nil {
            return nil
        }
    }
}

