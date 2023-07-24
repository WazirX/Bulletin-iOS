//
//  BulletinHelper.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 24/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

class BulletinHelper { }

extension BulletinHelper {
    
    // MARK: - View Controller Helper Methods
    public class func rootViewController(_ handler: ((_ rootVC: UIViewController?) -> Void)?) {
        
        if let handler = handler {
            DispatchQueue.main.async {
                handler(UIApplication.shared.keyWindow?.rootViewController)
            }
        }
    }
    
    
    public class func topMostViewController(_ handler: ((_ topMostVC: UIViewController?) -> Void)?) {
        
        if let handler = handler {
            
            DispatchQueue.main.async {
                let rootVC = UIApplication.shared.keyWindow?.rootViewController
                let topMostVC = BulletinHelper.topViewController(withRootViewController: rootVC)
                handler(topMostVC)
            }
        }
    }
    
    private class func topViewController(withRootViewController rootViewController: UIViewController?) -> UIViewController? {
        
        if let tabBarController = rootViewController as? UITabBarController {
            return BulletinHelper.topViewController(withRootViewController: tabBarController.selectedViewController)
        }
        else if let navigationController = rootViewController as? UINavigationController {
            return BulletinHelper.topViewController(withRootViewController: navigationController.visibleViewController)
        }
        else if let presentedViewController = rootViewController?.presentedViewController {
            return BulletinHelper.topViewController(withRootViewController: presentedViewController)
        }
        else {
            return rootViewController
        }
    }
    
}

