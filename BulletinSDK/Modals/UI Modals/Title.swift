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
    public var preTitleTextColor: String?
    var titleText: String?
    public var titleTextColor: String?
    var subTitleText: String?
    public var subTitleTextColor: String?

    
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
        
        // Set Pre Title Color
        if let preTitleTextColor = attributes["preTitleTextColor"] as? String {
            self.preTitleTextColor = preTitleTextColor
        }
        
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

