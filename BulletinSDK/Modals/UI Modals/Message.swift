//
//  Message.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit


class Message: BulletinItem {

    
    // MARK: - Enum
    enum MessageType: String  {
        case text
        case html
    }
    
    
    // MARK: - Variables
    var messageType: MessageType = .text
    var text: String?

    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .message
    }
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set Message Type
        if let messasgeTypeString = attributes["messageType"] as? String,
           let messageType = MessageType(rawValue: messasgeTypeString) {
            self.messageType = messageType
        }
        
        // Set Text
        guard let text = attributes["text"] as? String else { return nil }
        self.text = text
    }
}
