# Beton

`Beton` is a [Swift](http://docs.swift.org) library built on top of
the [Foundation](https://developer.apple.com/documentation/foundation) framework, that provides an additional layer of
functionality, including easy localization, performance test measurement support, convenience functions and so on.

## Modules

//GENERATE: MODULES

## Usage

The following example demonstrates the ``?!`` operator and ``sum`` extension
of [`Sequence`](https://developer.apple.com/documentation/swift/sequence) from the `Beton` module.

```swift
import Beton

struct InvalidInt: Error {
  let value: String
}

func example() throws {
  let sum = try ["1", "2", "3"].map { try Int($0) ?! InvalidInt(value: $0) }.sum()
  print(sum) // Prints: 6

  let _ = try ["1", "NaN", "3"].map { try Int($0) ?! InvalidInt(value: $0) }.sum()
  // Throws: InvalidInt("NaN")
}
```

## Adding `Beton` as a Dependency

To use the `Beton` library in a SwiftPM project, add it to the dependencies for your package and your target. Your
target can depend on either the `Beton` or `XCTBeton` modules, or both.

```swift
// swift-tools-version:5.5.0

import PackageDescription

let package = Package(
  name: "MyApplication",
  dependencies: [
    .package(url: "https://github.com/21GramConsulting/Beton", .branch("develop")),
  ],
  targets: [
    .target(name: "MyApplication", dependencies: [
      .product(name: "Beton", package: "Beton"),
      .product(name: "XCTBeton", package: "Beton"),
    ])
  ]
)
```
