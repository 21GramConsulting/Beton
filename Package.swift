// swift-tools-version:5.9

import PackageDescription

let package = Package(
  name: "Beton",
  defaultLocalization: LanguageTag("en_US"),
  platforms: [
    .macOS(.v12),
    .iOS(.v15),
    .tvOS(.v15),
    .watchOS(.v8),
    .visionOS(.v1),
  ],
  products: [
    .library(name: "Beton", targets: ["Beton"]),
    .library(name: "XCTBeton", targets: ["XCTBeton"]),
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-async-algorithms.git", from: "1.0.0"),
    .package(url: "https://github.com/apple/swift-docc-plugin", from: "1.3.0"),
  ],
  targets: [
    .target(
      name: "Beton",
      dependencies: [
        .product(name: "AsyncAlgorithms", package: "swift-async-algorithms")
      ],
      swiftSettings: swiftSettings
    ),
    .target(
      name: "XCTBeton",
      dependencies: [
        .byName(name: "Beton")
      ],
      swiftSettings: swiftSettings
    ),
    .testTarget(type: .unit),
    .testTarget(type: .performance),
    .testTarget(type: .regression),
    .testTarget(type: .userAcceptance),
  ]
)

/// MARK: Convenience units

extension PackageDescription.Target {
  enum TestType: String {
    case unit = "Unit"
    case performance = "Performance"
    case regression = "Regression"
    case userAcceptance = "UserAcceptance"
  }

  static func testTarget(type: TestType) -> PackageDescription.Target {
    .testTarget(
      name: "\(type.rawValue)Tests",
      dependencies: [
        .byName(name: "Beton"),
        .byName(name: "XCTBeton"),
      ],
      resources: [.process("Resources")]
    )
  }
}

let swiftSettings: [SwiftSetting] = [
  .unsafeFlags(["-Xfrontend", "-strict-concurrency=complete"])
]
