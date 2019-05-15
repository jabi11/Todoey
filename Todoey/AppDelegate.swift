//
//  AppDelegate.swift
//  Todoey
//
//  Created by Jan Biernacki on 06/05/2019.
//  Copyright © 2019 Jan Biernacki. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        do{
            try Realm()
        }catch{
            print("Error initialising new realm, \(error)")
        }
        
        
        return true
    }
    

}

