# Beton

`Beton` is a [Swift](http://docs.swift.org) library built on top of
the [Foundation](https://developer.apple.com/documentation/foundation) framework, that provides an additional layer of
functionality, including easy localization, performance test measurement support, convenience functions and so on.

## Modules

//GENERATE: MODULES

## Usage

The following example demonstrates the ``?!`` operator and ``sum`` extension
of [`Sequence`](https://developer.apple.com/documentation/swift/sequence) from the `Beton` module.

Notice that you do not need to import [Foundation](https://developer.apple.com/documentation/foundation) explicitly in
order to get [`Measurement`](https://developer.apple.com/documentation/foundation/measurement). That is because you get
it for free by importing `Beton.`

```swift
import Beton

struct InvalidValue: Error {
  let value: String
}

func parseMeter(_ s: String) throws -> Measurement<UnitLength> {
  Measurement(value: try Double(s) ?! InvalidValue(value: s), unit: .meters)
}

func example() throws {
  let sum = try ["1", "2", "3"].map(parseMeter).sum()
  print(sum) // Prints: 6.0 m

  let _ = try ["1", "bad number", "3"].map(parseMeter).sum()
  // Throws: InvalidValue(value: "bad number")
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
