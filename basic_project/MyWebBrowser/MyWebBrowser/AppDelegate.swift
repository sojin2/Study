//
//  AppDelegate.swift
//  MyWebBrowser
//
//  Created by 김소진 on 2020/04/16.
//  Copyright © 2020 sojin. All rights reserved.
//

import UIKit
import WebKit

//마지막 페이지 주소를 UserDefaults에서 관리하기 위한 키값
let lastPageURLDefualtKey: String = "lastURL"

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    //MARK: -Properties
    var window: UIWindow?
    var lastPageURL:URL?

    //MARK: - Methods
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.lastPageURL = UserDefaults.standard.url(forKey: lastPageURLDefualtKey)
        return true
    }

    // MARK: UISceneSession Lifecycle
    
    func applicationWillResignActive(_ application: UIApplication) {
        let userDefaults: UserDefaults
        userDefaults = UserDefaults.standard
        
        userDefaults.set(self.lastPageURL,forKey: lastPageURLDefualtKey)
        userDefaults.synchronize()
    }
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}
