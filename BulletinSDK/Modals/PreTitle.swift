//
//  PreTitle.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit

class PreTitle: BulletinItem {
    
    
    // MARK: - Variable
    var text: String?
    
    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .preTitle
    }
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set PreTitle
        guard let text = attributes["text"] as? String else { return nil }
        self.text = text
    }
}
