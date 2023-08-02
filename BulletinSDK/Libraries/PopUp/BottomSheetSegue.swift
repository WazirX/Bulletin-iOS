//
//  BottomSheetSegue.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 24/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit
import SwiftMessages

class BottomSheetSegue: SwiftMessagesSegue {
    
    
    // MARK: - Initialisation Method
    override public init(identifier: String?, source: UIViewController, destination: UIViewController) {
        super.init(identifier: identifier, source: source, destination: destination)
        
        // Override Configurations
        configure(layout: .bottomTab)
        interactiveHide = false
        dimMode = .color(color: UIColor.black.withAlphaComponent(0.70), interactive: true)
        source.view.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        source.view.layer.cornerRadius = AppStyle.BottomSheetCornerRadius
        if #available(iOS 13.0, *) {
            source.view.layer.cornerCurve = .continuous
        }
    }
}
