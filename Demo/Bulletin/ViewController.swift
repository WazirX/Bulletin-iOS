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
        
        // Creage DataStore Object
        let dataSource = BulletinDataStore()
        
        // Register Multiple Versions
        registerBulletingDetails(forVersion: Version("1.11"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12.1"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12.2"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.13"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.13.1"), inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.14"), inDataStore: dataSource)
    

        let sdk = BulletinSDK(dataStore: dataSource,appearance: Appearance.whiteKnight)
        let bulletinView = sdk.getFullBulletin()
//        let _ = sdk.getLastBulletins(limit: 5)
//        let _ = sdk.getUnseenBulletins(limit: 4)
        
        if let bulletinView = bulletinView {
            self.view.addSubview(bulletinView)
        }
        
        // Get Top Most View Controller
//        BulletinHelper.topMostViewController { (topMostVC) in
//
//            // Validation
//            guard let topMostVC = topMostVC else {
//                return
//            }
//
//            // Display Self Declaration PopUp VC
//            let segue = AlertSegue(identifier: nil, source: topMostVC, destination: bulletinView)
//            topMostVC.prepare(for: segue, sender: nil)
//            segue.perform()
//
//        }
    }

    private func registerBulletingDetails(forVersion version: Version?, inDataStore dataStore: BulletinDataStore)   {
        
        // Validation
        guard let version = version else {
            return
        }
                
        let title2 = Title()
        title2.preTitleText = "Version " + version.version
        title2.titleText = "In this update"
        title2.subTitleText = "Vestibulum id ligula porta felis euismod semper. Vesti bu lum id ligula porta felis euismod semper."
        
        let message2 = Message()
        message2.messageType = .text
        message2.text = "Vestibulum id ligula porta felis euismod semper. Morbi leo risus, porta ac consectetur ac, vestibulum at eros."
        
        let media = Media()
        media.size = CGSize(width: 300.0, height: 300.0)
        media.url = URL(string:"https://media.wazirx.com/test_resources/crypto_gifts.png")
        
        let bullet2 = Bullet()
        bullet2.bulletType = .unicode
        bullet2.unicode = "1f44d"
        
        let bulletPoint21 = BulletPoint()
        bulletPoint21.bullet = bullet2
        bulletPoint21.titleText = "Vestibulum"
        bulletPoint21.subTitleText = "Etiam porta sem malesuada magna mollis euismod."
        
        let bulletPoint22 = BulletPoint()
        bulletPoint22.bullet = bullet2
        bulletPoint22.titleText = "Justo Condimentum"
        bulletPoint22.subTitleText = "Sed posuere consectetur est at lobortis. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
        
        let actionButton = ActionButton()
        actionButton.title = "Take me to Crypto Gifts"
               
        // Create Items List
        let bulletItems2 = [title2, message2, actionButton,media, bulletPoint21]// [title2, message2, bulletPoint21, bulletPoint22]
        
        // Register Item
        dataStore.registerVersionInfo(version: version, items: bulletItems2)
    }

}

