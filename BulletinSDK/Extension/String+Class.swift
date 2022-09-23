//
//  String+Class.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import Foundation

extension String {

    // Note : This method is capable of returning any Swift or Obj-C class with its name
    public static func classFromString(_ className: String?) -> AnyClass?   {
        
        if let className = className   {
            
            // Get Class
            let _class : AnyClass? = NSClassFromString(className)
            if _class == nil {
                
                // Check for a swift class with the same name
                let bundleName = Bundle.main.object(forInfoDictionaryKey: "CFBundleExecutable") as? String
                if let bundleName = bundleName  {
                    let swiftClassName = bundleName + "." + className
                    return NSClassFromString(swiftClassName)
                }
            }
            return _class
        }
        return nil
    }
    
    public func classFromString() -> AnyClass?   {
        return String.classFromString(self)
    }
}
