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
    private let mobileKey = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setUpLDClient()

        return true
    }

    private func setUpLDClient() {
        let user = LDUser(key: "test@email.com")

        var config = LDConfig(mobileKey: mobileKey)
//        config.streamingMode = .polling
//        config.flagPollingInterval = 30.0
        config.eventFlushInterval = 30.0

        LDClient.shared.start(config: config, user: user)
    }
}
