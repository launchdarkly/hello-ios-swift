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

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpLDClient()

        return true
    }

    private func setUpLDClient() {
        var contextBuilder = LDContextBuilder(key: "test@email.com")
        contextBuilder.trySetValue("firstName", .string("Bob"))
        contextBuilder.trySetValue("lastName", .string("Loblaw"))
        contextBuilder.trySetValue("groups", .array([.string("beta_testers")]))

        guard case .success(let context) = contextBuilder.build()
        else { return }

        // If you want to disable the Auto EnvironmentAttributes functionality.
        // Use .disabled as the autoEnvAttributes argument to the constructor
        var config = LDConfig(mobileKey: mobileKey, autoEnvAttributes: .enabled)
        config.eventFlushInterval = 30.0

        LDClient.start(config: config, context: context)
    }
}
