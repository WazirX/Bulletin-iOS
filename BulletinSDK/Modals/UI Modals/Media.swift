//
//  Media.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit


class Media: BulletinItem {

    
    // MARK: - Enum
    enum MediaType: String  {
        case image
    }
    
    
    // MARK: - Variables
    var mediaType: MediaType = .image
    var url: URL?
    var size: CGSize?
    
    
    // MARK: - Initialisation Methods
    override init () {
        super.init()
        
        // Set Type
        type = .media
    }
    
    required init?(attributes: [AnyHashable: Any]) {
        super.init(attributes: attributes)
        
        // Set Media Type
        if let mediaTypeString = attributes["mediaType"] as? String,
           let mediaType = MediaType(rawValue: mediaTypeString) {
            self.mediaType = mediaType
        }
        
        // Set Url
        guard let urlString = attributes["url"] as? String,
              let mediaUrl = URL(string: urlString)  else {
            return nil
        }
        url = mediaUrl
        
        // Set Size
        if let width = attributes["width"] as? CGFloat,
            let height = attributes["height"] as? CGFloat
        {
            size = CGSize(width: width, height: height)
        }
    }
}

