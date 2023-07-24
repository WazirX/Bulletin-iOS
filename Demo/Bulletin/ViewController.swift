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
        registerBulletingDetails(forVersion: Version("1.11")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12.1")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.12.2")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.13")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.13.1")!, inDataStore: dataSource)
        registerBulletingDetails(forVersion: Version("1.14")!, inDataStore: dataSource)
    

        let sdk = BulletinSDK(dataStore: dataSource)
        let bulletinView = sdk.getFullBulletin()
        let _ = sdk.getLastBulletins(limit: 5)
        let _ = sdk.getUnseenBulletins(limit: 4)
        
        if let bulletinView = bulletinView {
            bulletinView.backgroundColor = UIColor.red
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

    private func registerBulletingDetails(forVersion version: Version, inDataStore dataStore: BulletinDataStore)   {
                
        let title2 = Title()
        title2.preTitleText = "Version " + version.version
        title2.titleText = "In this update"
        title2.subTitleText = "loreum ipsum loreum ipsum loreum ipsum"
        
        let message2 = Message()
        message2.messageType = .text
        message2.text = "Vestibulum id ligula porta felis euismod semper."
        
        let bullet2 = Bullet()
        bullet2.bulletType = .unicode
        bullet2.unicode = "U+0031"
        
        let bulletPoint21 = BulletPoint()
        bulletPoint21.bullet = bullet2
        bulletPoint21.titleText = "Vestibulum"
        bulletPoint21.subTitleText = "Etiam porta sem malesuada magna mollis euismod."
        
        let bulletPoint22 = BulletPoint()
        bulletPoint22.bullet = bullet2
        bulletPoint22.titleText = "Justo Condimentum"
        bulletPoint22.subTitleText = "Sed posuere consectetur est at lobortis. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor."
               
        // Create Items List
        let bulletItems2 = [title2, message2, bulletPoint21, bulletPoint22]
        
        // Register Item
        dataStore.registerVersionInfo(version: version, items: bulletItems2)
    }

}

