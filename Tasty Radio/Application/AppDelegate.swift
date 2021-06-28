//
//  AppDelegate.swift
//  Tasty Radio
//
//  Created by Vitaliy Podolskiy on 11/21/20.
//

import UIKit
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()

        self.window = UIWindow(frame: UIScreen.main.bounds)
        LaunchManager().createWindow(window: window)
        
        return true
    }

}

