// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "AspireSecureEncryption",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "AspireSecureEncryption",
            targets: ["SecureEncryptionPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", from: "7.0.0")
    ],
    targets: [
        .target(
            name: "SecureEncryptionPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm")
            ],
            path: "ios/Sources/SecureEncryptionPlugin"),
        .testTarget(
            name: "SecureEncryptionPluginTests",
            dependencies: ["SecureEncryptionPlugin"],
            path: "ios/Tests/SecureEncryptionPluginTests")
    ]
)