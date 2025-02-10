import Foundation

@objc public class SecureEncryption: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
