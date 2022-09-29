//
//  ActionButton.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit

class ActionButton: BulletinItem {

    
    // MARK: Variables
    var title: String?
    var clickPayload: Any?
    
    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .actionButton
    }
    
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set Title
        guard let title = attributes["title"] as? String else {
            return nil
        }
        self.title = title
        
        // Set Click Payload
        self.clickPayload = attributes["clickPayload"]
    }
}

