//
//  ViewController.swift
//  LaunchDarklyHelloWorld
//
//  Created by Korhan Bircan on 3/24/17.
//  Copyright © 2017 Korhan Bircan. All rights reserved.
//

import UIKit
import LaunchDarkly

class ViewController: UIViewController {
    @IBOutlet weak var featureFlagLabel: UILabel!

    // Enter your feature flag name here.
    fileprivate let featureFlagKey = "hello-ios-boolean"

    override func viewDidLoad() {
        super.viewDidLoad()

        LDClient.get()?.observe(key: featureFlagKey, owner: self) { [weak self] changedFlag in
            self?.featureFlagDidUpdate(changedFlag.key)
        }
        checkFeatureValue()
    }

    fileprivate func checkFeatureValue() {
        let featureFlagValue = LDClient.get()!.variation(forKey: featureFlagKey, defaultValue: false)
        updateLabel(value: featureFlagValue)
    }

    fileprivate func updateLabel(value: Bool) {
        featureFlagLabel.text = "\(featureFlagKey): \(value)"
    }

    func featureFlagDidUpdate(_ key: LDFlagKey) {
        if key == featureFlagKey {
            checkFeatureValue()
        }
    }
}
