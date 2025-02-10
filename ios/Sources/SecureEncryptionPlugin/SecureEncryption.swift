import Foundation
import CommonCrypto

@objc public class SecureEncryption: NSObject {
    private static let secretKey = "6w9z$C&F)J@NcRfU"

    @objc public static func encrypt(_ plaintext: String) -> String? {
        guard let keyData = secretKey.data(using: .utf8),
              let plaintextData = plaintext.data(using: .utf8) else { return nil }

        let encryptedData = try? AES.encrypt(data: plaintextData, key: keyData)
        return encryptedData?.base64EncodedString()
    }

    @objc public static func decrypt(_ encryptedText: String) -> String? {
        guard let keyData = secretKey.data(using: .utf8),
              let encryptedData = Data(base64Encoded: encryptedText) else { return nil }

        let decryptedData = try? AES.decrypt(data: encryptedData, key: keyData)
        return decryptedData.flatMap { String(data: $0, encoding: .utf8) }
    }
}

class AES {
    static func encrypt(data: Data, key: Data) throws -> Data {
        var cryptData = Data(count: data.count + kCCBlockSizeAES128)
        let keyLength = kCCKeySizeAES128
        let operation = CCOperation(kCCEncrypt)
        var numBytesEncrypted: size_t = 0

        let cryptStatus = CCCrypt(operation, CCAlgorithm(kCCAlgorithmAES), CCOptions(kCCOptionPKCS7Padding),
                                  key.bytes, keyLength, nil, data.bytes, data.count,
                                  &cryptData, cryptData.count, &numBytesEncrypted)

        guard cryptStatus == kCCSuccess else { throw NSError(domain: "Encryption failed", code: cryptStatus, userInfo: nil) }
        cryptData.removeSubrange(numBytesEncrypted..<cryptData.count)
        return cryptData
    }

    static func decrypt(data: Data, key: Data) throws -> Data {
        var decryptedData = Data(count: data.count + kCCBlockSizeAES128)
        let keyLength = kCCKeySizeAES128
        let operation = CCOperation(kCCDecrypt)
        var numBytesDecrypted: size_t = 0

        let cryptStatus = CCCrypt(operation, CCAlgorithm(kCCAlgorithmAES), CCOptions(kCCOptionPKCS7Padding),
                                  key.bytes, keyLength, nil, data.bytes, data.count,
                                  &decryptedData, decryptedData.count, &numBytesDecrypted)

        guard cryptStatus == kCCSuccess else { throw NSError(domain: "Decryption failed", code: cryptStatus, userInfo: nil) }
        decryptedData.removeSubrange(numBytesDecrypted..<decryptedData.count)
        return decryptedData
    }
}

extension Data {
    var bytes: UnsafeRawPointer { return (self as NSData).bytes }
}
