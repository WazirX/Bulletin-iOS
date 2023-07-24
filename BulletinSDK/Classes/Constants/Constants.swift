//
//  WZConstants.swift
//  WazirX
//
//  Created by Daxesh Nagar on 17/07/23.
//  Copyright © 2017 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit



// MARK: -
public struct App   {
    
    // App Lock State
    public enum LockState: Int  {
        case locked = 0
        case unlocked
    }
    
    // MARK: Variables
    public static let Platform = "iOS"
    public static let Name = "WazirX"
    public static let DevLanguage = "Swift"
    public static let TeamID = "CAQ757V6Q3"
    public static let BundleID = Bundle.main.bundleIdentifier!
    public static let Version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
    public static let BuildNumber = Bundle.main.infoDictionary?[kCFBundleVersionKey as String] as! String
    public static func URLScheme() -> String { return "wazirx://"}

    
    
    // Redirects User To App Permissions In Device Settings
    public static func OpenAppPermissionsInDeviceSettings(completion: ((Bool) -> Swift.Void)?) {
        if let url = URL(string: UIApplication.openSettingsURLString),
           UIApplication.shared.canOpenURL(url)
        {
            UIApplication.shared.open(url, options: Dictionary(), completionHandler: completion)
        }
    }
    
}


// MARK: -
extension NSNotification.Name {
    public static let AppearanceDidUpdate = NSNotification.Name("AppearanceDidUpdate")
    public static let UserDidLogin = NSNotification.Name("UserDidLogin")
}


// MARK: -
public struct HappinessPoints   {
    public static func Threshold() -> Int { return 20 }
    public static func BuyOrder() -> Int { return 7 }
    public static func SellOrder() -> Int { return 7 }
    public static func ShareWithFriends() -> Int { return 5 }
    public static func Error() -> Int { return 2 }
}


// MARK: -
public struct AppRating {
    public static func DaysIntervalBetweenPointsReset() -> Int { return 14 }
    public static func DaysIntervalBetweenTwoAppRatePopup() -> Int { return 40 }
}



// MARK: -
public struct S3ImageName   {
    
    // Create S3 Images Constants
    public static func qbs_texture() -> String { return "qbs_texture" }
    public static func no_token() -> String { return "no_token" }
    public static func qbs_failure() -> String { return "qbs_failure" }
    public static func qbs_success() -> String { return "qbs_success" }
    public static func qbs_warning() -> String { return "qbs_warning" }
    public static func sand_clock() -> String { return "sand_clock" }
    
}


// MARK: - Regex
public struct Regex {
    
    public static func email() -> String {
        return "[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}" + "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" + "(" + "\\." + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+"
    }
}
