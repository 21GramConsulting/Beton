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
