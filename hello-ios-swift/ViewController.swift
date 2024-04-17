import UIKit
import LaunchDarkly

class ViewController: UIViewController {
    @IBOutlet weak var featureFlagLabel: UILabel!

    // Set featureFlagKey to the feature flag key you want to evaluate.
    fileprivate let featureFlagKey = "sample-feature"

    override func viewDidLoad() {
        super.viewDidLoad()

        if let ld = LDClient.get() {
            ld.observe(key: featureFlagKey, owner: self) { [weak self] changedFlag in
                guard let me = self else { return }
                guard case .bool(let booleanValue) = changedFlag.newValue else { return }

                me.updateUi(flagKey: changedFlag.key, result: booleanValue)
            }
            let result = ld.boolVariation(forKey: featureFlagKey, defaultValue: false)
            updateUi(flagKey: featureFlagKey, result: result)
        }
    }

    func updateUi(flagKey: String, result: Bool) {
        self.featureFlagLabel.text = "The \(flagKey) feature flag evaluates to \(result)"

        let toggleOn = UIColor(red: 0, green: 0.52, blue: 0.29, alpha: 1)
        let toggleOff = UIColor(red: 0.22, green: 0.22, blue: 0.25, alpha: 1)
        self.view.backgroundColor = result ? toggleOn : toggleOff
    }
}
