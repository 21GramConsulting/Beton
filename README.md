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

### Importing

To use `Beton` simply import it. If you need anything
from [Foundation](https://developer.apple.com/documentation/foundation) you do not need to explicitly import it. You get
it for free by importing `Beton.`

```swift
import Beton
```

### Convenience features for [`Bundle`](https://developer.apple.com/documentation/foundation/bundle)

Using `Beton` it is quite easy to get localized bundles and values from them.

Suppose you have a localization bundle in your project for the `hu_HU` locale, with a translation for `"Apple" = "Alma"`
, but you don't have one for `"Banana"` (which would be `"Banán"`). The following example finds the bundle, gets the
localized version of `"Apple"`, and falls back to the given key `"Banana"`.

```swift
let bundle          = Bundle.module.localizationBundles["hu_HU"]
let localizedApple  = bundle?.localizedString("Apple")
// localizedApple == "Alma"
let localizedBanana = bundle?.localizedString("Banana")
// localizedBanana == "Banana"
```

### Convenience for [`Locale`](https://developer.apple.com/documentation/foundation/locale)

Locales in `Beton` are expressible by string literals.

```swift
let locales: [Locale] = ["en_US", "en_GB", "hu_HU"]
for locale in locales {
  print("Currency symbol: \(locale.currencySymbol ?? "N/A")")
}
// Prints:
// Currency symbol: $
// Currency symbol: £
// Currency symbol: Ft
```

### ``?!`` operator

The ``?!`` operator unwraps an [`Optional`](https://developer.apple.com/documentation/swift/optional) value if is
not `nil`, otherwise throws the given error.

```swift
struct GenericError: Error {}

let answer = try Int("42") ?! GenericError()
// answer == 42

try Int("NaN") ?! GenericError()
// Throws: GenericError()
```

### ``sum`` extension on [`Sequence`](https://developer.apple.com/documentation/swift/sequence)s

Calculates the total of all elements in a sequence. Available on any sequence with values that conform
to [`AdditiveArithmetic`](https://developer.apple.com/documentation/swift/additivearithmetic)

```swift
let arraySum = [1.1, 2.2, 3.3, 4.4, 5.5].sum()
// arraySum == 16.5

let rangeSum = (1..<10).sum()
// rangeSum == 45

let setSum = Set(arrayLiteral: 1, 2, 3, 2, 3).sum()
// setSum == 6
```

### Convenience for [`Measurement`](https://developer.apple.com/documentation/foundation/measurement)s

In `Beton` measurements have default units and they conform
to [`AdditiveArithmetic`](https://developer.apple.com/documentation/swift/additivearithmetic).

```swift
let sum = [1, 2, 3].map { Measurement<UnitLength>(value: $0, unit: .default) }.sum()
// sum == 6.0 m
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
