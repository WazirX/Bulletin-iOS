//
//  BulletinInfo.swift
//  Bulletin
//
//  Created by Pranav Panchal on 27/09/22.
//  Copyright © 2022 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

class BulletinInfo {
    
    
    // MARK: - Variables
    public var version: Version
    public var items: [BulletinItem]
    
    
    // MARK: - Initialisation Method
    init(version: Version, items: [BulletinItem]) {
        
        // Set Version
        self.version = version
        
        // Set Items
        self.items = items
    }
}

