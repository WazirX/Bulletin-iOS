//
//  ViewController.swift
//  Bulletin
//
//  Created by Pranav Panchal on 22/09/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let dataSource = BulletinDataStore()

        /// v 1 .13 //////
        let preTitle = PreTitle()
        preTitle.text = "Version 1.13"
        
        let title = Title()
        title.text = "Introducing Crypto Gifts"
        
        let message = Message()
        message.messageType = .text
        message.text = "Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros."
        
        let media = Media()
        media.url = URL(string: "https://media.wazirx.com/action_cards/coin_reports.jpg")
        media.size = CGSize(width: 1200, height: 500)
        
        let bullet = Bullet()
        bullet.bulletType = .unicode
        bullet.unicode = "U+0031"
        
        let bulletPoint = BulletPoint()
        bulletPoint.bullet = bullet
        bulletPoint.titleText = "Vestibulum"
        bulletPoint.subTitleText = "Etiam porta sem malesuada magna mollis euismod."
        
        let actionButton = ActionButton()
        actionButton.title = "Take me to Crypto Gifts ->"
                
        let bulletItems = [preTitle, title, message, media, bulletPoint, actionButton]
        
        dataSource.registerVersionInfo(version: "1.13", items: bulletItems)
        /// v 1 .13 /////

        /// v 1 .13.1 //////
        let preTitle1 = PreTitle()
        preTitle1.text = "Version 1.13.1"
        
        let title1 = Title()
        title1.text = "In this update"
        
        let message1 = Message()
        message1.messageType = .text
        message1.text = "Vestibulum id ligula porta felis euismod semper."
        
        let bullet1 = Bullet()
        bullet1.bulletType = .unicode
        bullet1.unicode = "U+0031"
        
        let bulletPoint1 = BulletPoint()
        bulletPoint1.bullet = bullet1
        bulletPoint1.titleText = "Vestibulum"
        bulletPoint1.subTitleText = "Etiam porta sem malesuada magna mollis euismod."
        
        let bulletPoint2 = BulletPoint()
        bulletPoint2.bullet = bullet1
        bulletPoint2.titleText = "Justo Condimentum"
        bulletPoint2.subTitleText = "Sed posuere consectetur est at lobortis. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
                
        let bulletItems1 = [preTitle1, title1, message1, bulletPoint1, bulletPoint2]
        
        dataSource.registerVersionInfo(version: "1.13.1", items: bulletItems1)
        /// v 1 .13 .1/////
        
        let sdk = BulletinSDK(dataStore: dataSource)
        sdk.showBulletin(fromVersion: "1.13")
    }


}

