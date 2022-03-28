# Beton

`Beton` is a [Swift](http://docs.swift.org) library built on top of
the [Foundation](https://developer.apple.com/documentation/foundation) framework, that provides an additional layer of
functionality, including easy localization, performance test measurement support, and convenience functionality.
For us, `Beton` is primarily, but not exclusively, useful for server-side Swift engineering.

## Modules

- [Beton](#using-the-beton-module): Generic purpose functionalities that may be useful for every application.
- [XCTBeton](#using-the-xctbeton-module): Extends the capabilities of [XCTest](https://developer.apple.com/documentation/xctest) by
providing assertions for performance measurements.

## Using the Beton Module

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

## Using the XCTBeton Module

Let's say you have a simple performance test that measures some code.
Using [XCTest](https://developer.apple.com/documentation/xctest/xctestcase/3194265-measure) there is no easy,
straightforward way to make assertions to the performance results.

```swift
import XCTest

class PerformanceTests: XCTestCase {
  func test_measureSum() {
    measure {
      let _ = (1..<1000).reduce(0, +)
    }
    // Performance assertions needed!
  }
}
```

You can turn this code into an `XCTBeton` test by simply changing the import. Yes, that's it. You can now make
assertions!

```swift
import XCTBeton

class PerformanceTests: XCTestCase {
  func test_measureSum() {
    measure {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.clock, .timeMonotonic, .average(maximum: 0.001))
  }
}
```

If you want to control the type of measurements, and how many times the tests run you can do that using the same API as
you would in regular [XCTest](https://developer.apple.com/documentation/xctest/xctestcase/3194265-measure).

```swift
import XCTBeton

class PerformanceTests: XCTestCase {
  func test_measureSum() {
    let options = XCTMeasureOptions()
    options.iterationCount = 100
    measure(metrics: [XCTCPUMetric(), XCTMemoryMetric()], options: options) {
      let _ = (1..<1000).reduce(0, +)
    }
    XCTAssertMetric(.cpu, .time, .average(maximum: 0.002))
    XCTAssertMetric(.cpu, .cycles, .average(maximum: 2000))
    XCTAssertMetric(.memory, .physical, .average(maximum: 20))
  }
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
