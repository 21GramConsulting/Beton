// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Beton",
  defaultLocalization: LanguageTag("en_US"),
  platforms: [
    .macOS(.v12),
    .iOS(.v13),
  ],
  products: [
    .library(name: "Beton", targets: ["Beton"]),
    .library(name: "XCTBeton", targets: ["XCTBeton"]),
  ],
  targets: [
    .target(name: "Beton"),
    .target(
      name: "XCTBeton",
      dependencies: [
        .byName(name: "Beton")
      ]
    ),
    .testTarget(type: .unit),
    .testTarget(type: .component),
    .testTarget(type: .integration),
    .testTarget(type: .system),
    .testTarget(type: .performance),
  ]
)

/// MARK: Convenience units

extension PackageDescription.Target {
  enum TestType: String {
    case unit        = "Unit"
    case component   = "Component"
    case integration = "Integration"
    case system      = "System"
    case performance = "Performance"
  }

  static func testTarget(type: TestType) -> PackageDescription.Target {
    .testTarget(
      name: "\(type.rawValue)Tests",
      dependencies: [
        .byName(name: "Beton"),
        .byName(name: "XCTBeton")
      ],
      resources: [.process("Resources")]
    )
  }
}
