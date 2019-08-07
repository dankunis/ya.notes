//
//  AppDelegate.swift
//  Ya.Notes
//
//  Created by Daniel Kunis on 07/08/2019.
//  Copyright © 2019 Daniel Kunis. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    private let rootAssembly = RootAssembly()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let controller = rootAssembly.presentationAssembly.demoViewController()
        window?.rootViewController = controller
        window?.makeKeyAndVisible()
        
        return true
    }
}

