//
//  String+HTML.swift
//  Bulletin
//
//  Created by Daxesh Nagar on 21/07/23.
//  Copyright © 2023 Copyright © 2022 Zanmai Labs Private Limited. All rights reserved.
//

import UIKit

extension String {
    
    public func html2AttributedString(usingFont font: UIFont?, color: UIColor = .black) -> NSMutableAttributedString?    {
        
        let text : String
        
        // Add Font Attributes
        if let font = font {
            let colorHashCode = color.hexString()
            let startTag = "<SPAN style=\"font-size:\(font.pointSize)px; font-family:'\(font.fontName)','-apple-system'; color:\(colorHashCode)\">"
            let endTag = "</SPAN>"
            text = (startTag + self + endTag)
        }
        else    {
            text = self as String
        }
        
        // Convert HTML To Attributed String
        do {
            return try NSMutableAttributedString(data: Data(text.utf8), options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return nil
        }
    }
}

