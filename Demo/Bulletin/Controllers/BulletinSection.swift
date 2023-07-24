//
//  BulletinSection.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 24/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import IGListKit


class BulletinSection : NSObject  {
    
    
    // MARK: - Variables
    public var bulletinInfo = [BulletinInfo]()
    
}

extension BulletinSection : ListDiffable {
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        return isEqual(object)
    }
}
