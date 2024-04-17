import UIKit
import LaunchDarkly

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    // Set sdkKey to your LaunchDarkly mobile key.
    private let sdkKey = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setUpLDClient()

        return true
    }

    private func setUpLDClient() {
        // Set up the evaluation context. This context should appear on your
        // LaunchDarkly contexts dashboard soon after you run the demo.
        var contextBuilder = LDContextBuilder(key: "example-user-key")
        contextBuilder.kind("user")
        contextBuilder.name("Sandy")

        guard case .success(let context) = contextBuilder.build()
        else { return }

        let config = LDConfig(mobileKey: sdkKey, autoEnvAttributes: .enabled)
        LDClient.start(config: config, context: context, startWaitSeconds: 30)
    }
}
