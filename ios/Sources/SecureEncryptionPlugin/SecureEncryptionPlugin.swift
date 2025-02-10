import Foundation
import Capacitor

@objc(SecureEncryptionPlugin)
public class SecureEncryptionPlugin: CAPPlugin {
    
    @objc func encrypt(_ call: CAPPluginCall) {
        guard let plaintext = call.getString("plaintext") else {
            call.reject("Plaintext is required")
            return
        }

        if let ciphertext = SecureEncryption.encrypt(plaintext) {
            call.resolve(["ciphertext": ciphertext])
        } else {
            call.reject("Encryption failed")
        }
    }

    @objc func decrypt(_ call: CAPPluginCall) {
        guard let ciphertext = call.getString("ciphertext") else {
            call.reject("Ciphertext is required")
            return
        }

        if let plaintext = SecureEncryption.decrypt(ciphertext) {
            call.resolve(["plaintext": plaintext])
        } else {
            call.reject("Decryption failed")
        }
    }
}
