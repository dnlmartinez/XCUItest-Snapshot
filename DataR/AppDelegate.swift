//
//  AppDelegate.swift
//  DataR
//
//  Created by daniel martinez gonzalez on 5/7/16.
//  Copyright © 2016 daniel martinez gonzalez. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        if(!NSUserDefaults.standardUserDefaults().boolForKey("FirstLoad"))
        {
            //Clean All Data saved in NSUserDefault
            for key in Array(NSUserDefaults.standardUserDefaults().dictionaryRepresentation().keys)
            {
                NSUserDefaults.standardUserDefaults().removeObjectForKey(key)
            }
            
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "FirstLoad")
            NSUserDefaults.standardUserDefaults().setInteger(0, forKey: "Indice")
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication){ }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }

}

