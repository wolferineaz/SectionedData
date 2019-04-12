//
//  AppDelegate.swift
//  SectionedDataExample
//
//  Created by Tabriz Dzhavadov on 12/04/2019.
//  Copyright © 2019 Tabriz Dzhavadov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return RootRouterImpl.default.application(didFinishLaunchingWithOptions: launchOptions)
    }

}

