# LaunchDarkly sample iOS application

We've built a simple mobile application that demonstrates how LaunchDarkly's SDK works.

Below, you'll find the build procedure. For more comprehensive instructions, you can visit your [Quickstart page](https://app.launchdarkly.com/quickstart#/) or the [iOS reference guide](https://docs.launchdarkly.com/sdk/client-side/ios).

## Build instructions

1. Make sure you have [Xcode](https://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12) installed
1. Run 'pod install' to get the latest iOS client integrated.
1. Open `hello-ios.xcworkspace` in Xcode
1. Set the value of `sdkKey` in `AppDelegate.swift` to your LaunchDarkly mobile key. If there is an existing boolean feature flag in your LaunchDarkly project that you want to evaluate, set `featureFlagKey` in `ViewController.swift` to the flag key.

```swift
    // AppDelegate.swift
    private let sdkKey = ""

    // ViewController.swift
    fileprivate let featureFlagKey = "sample-feature"

```

You should see the message "The <flagKey> feature flag evaluates to <flagValue>.", the application will run continuously and react to the flag changes in LaunchDarkly.
