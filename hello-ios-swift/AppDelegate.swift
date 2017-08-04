//
//  AppDelegate.swift
//  LaunchDarklyHelloWorld
//
//  Created by Korhan Bircan on 3/24/17.
//  Copyright © 2017 Korhan Bircan. All rights reserved.
//

import UIKit
import LaunchDarkly

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // Enter your mobile key here: Account Settings -> Your Projects -> Production/Test -> Mobile key.
    private let mobileKeyTest = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setUpLDClient()

        return true
    }

    private func setUpLDClient() {
        let userBuilder = LDUserBuilder()
        userBuilder.key = "test@email.com"

        let config = LDConfig(mobileKey: mobileKeyTest)

        LDClient.sharedInstance().start(config, with: userBuilder)
    }
}
