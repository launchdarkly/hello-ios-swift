#if os(iOS)
import Foundation
import UIKit

class IOSEnvironmentReporter: EnvironmentReporterChainBase {
    override var applicationInfo: ApplicationInfo {
        var info = ApplicationInfo()
        info.applicationIdentifier(Bundle.main.object(forInfoDictionaryKey: "CFBundleIdentifier") as? String)
        info.applicationVersion(Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String)
        info.applicationName(Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as? String)
        info.applicationVersionName(Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String)

        // defer to super if applicationId is missing.  This logic is after the setter since the setter has built in sanitization
        if info.applicationId == nil {
            info = super.applicationInfo
        }
        return info
    }

    override var deviceModel: String { UIDevice.current.model }
    override var systemVersion: String { UIDevice.current.systemVersion }
}
#endif
